# optimade-gnome

> ⚠️ Completely unofficial and separate from the deepmind work, use at your own risk, will probably only host it for a few months at most. ⚠️

Taking some data from https://github.com/google-deepmind/materials_discovery and making it available as an OPTIMADE API, at least temporarily, at https://optimade-gnome.odbx.science. This only contains the PBE dataset for now.

The motivation is that this dataset can then be easily filtered by property and composition, returning structures that can be used by other labs (autonomous or otherwise), and also serendipitously, without needing to know which database to search in ahead of time.

Uses https://github.com/Materials-Consortia/optimade-python-tools and https://github.com/materialscloud-org/archive-optimade-integration (to be released soon)

## Process

- Clone with submodule.
- Download data using provided scripts in submodule, after `pip install -r requirements.txt` from this repo.
  python materials_discovery/scripts/download_data_wget.py
- Install the currently named archive-optimade-integration for easy ingestion
  directly from static files, using the `optimade.yaml` file.
- Use the `optimake` CLI to create an OPTIMADE-compliant JSONL file, then insert into your db of choice and host it wherever you like...

## Example queries

- Filter out any phases that include lathanides or actinides with [`?filter=NOT elements HAS ANY "Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb"`](https://optimade-gnome.odbx.science/v1/structures?filter=NOT%20elements%20HAS%20ANY%20%22Ac%22,%20%22Th%22,%20%22Pa%22,%20%22U%22,%20%22Np%22,%20%22Pu%22,%20%22Am%22,%20%22Cm%22,%20%22Bk%22,%20%22Cf%22,%20%22Es%22,%20%22Fm%22,%20%22Md%22,%20%22No%22,%20%22La%22,%20%22Ce%22,%20%22Pr%22,%20%22Nd%22,%20%22Pm%22,%20%22Sm%22,%20%22Eu%22,%20%22Gd%22,%20%22Tb%22,%20%22Dy%22,%20%22Ho%22,%20%22Er%22,%20%22Tm%22,%20%22Yb%22) (leaving around 120k phases)
- Filter only for binary and ternary phases with [`?filter=nelements > 1 AND nelements < 4`](https://optimade-gnome.odbx.science/v1/structures?filter=nelements%3E1%20AND%20nelements%3C4)
- Binary phases excluding the lanthanides/actinides: [`?filter=nelements=2 AND NOT elements HAS ANY "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", "Fm", "Md", "No", "La", "Ce", "Pr", "Nd", "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb"`](https://optimade-gnome.odbx.science/v1/structures?filter=NOT%20elements%20HAS%20ANY%20%22Ac%22,%20%22Th%22,%20%22Pa%22,%20%22U%22,%20%22Np%22,%20%22Pu%22,%20%22Am%22,%20%22Cm%22,%20%22Bk%22,%20%22Cf%22,%20%22Es%22,%20%22Fm%22,%20%22Md%22,%20%22No%22,%20%22La%22,%20%22Ce%22,%20%22Pr%22,%20%22Nd%22,%20%22Pm%22,%20%22Sm%22,%20%22Eu%22,%20%22Gd%22,%20%22Tb%22,%20%22Dy%22,%20%22Ho%22,%20%22Er%22,%20%22Tm%22,%20%22Yb%22%20AND%20nelements=2)


## References

Paper with the source data:

> Merchant, A., Batzner, S., Schoenholz, S.S. et al. Scaling deep learning for materials discovery. Nature (2023). https://doi.org/10.1038/s41586-023-06735-9

OPTIMADE format/federation description:

> Andersen, C.W., Armiento, R., Blokhin, E. et al. OPTIMADE, an API for exchanging materials data. Sci Data 8, 217 (2021). https://doi.org/10.1038/s41597-021-00974-z

Tools used:

> Evans et al., (2021). optimade-python-tools: a Python library for serving and consuming materials data via OPTIMADE APIs. Journal of Open Source Software, 6(65), 3458, https://doi.org/10.21105/joss.03458
