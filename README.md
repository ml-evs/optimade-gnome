# optimade-gnome

> ⚠️ Completely unofficial and separate from the deepmind work, use at your own risk, will probably only host it for a few months at most. ⚠️

Taking some data from https://github.com/google-deepmind/materials_discovery and making it available as an OPTIMADE API, at least temporarily, at https://optimade-gnome.odbx.science.

The motivation is that this dataset can then be easily filtered by property and composition, returning structures that can be used by other labs (autonomous or otherwise), and also serendipitously, without needing to know which database to search in ahead of time.

Uses https://github.com/Materials-Consortia/optimade-python-tools and https://github.com/materialscloud-org/archive-optimade-integration (to be released soon)

## Process

- Clone with submodule.
- Download data using provided scripts in submodule, after `pip install -r requirements.txt` from this repo.
  python materials_discovery/scripts/download_data_wget.py
- Install the currently named archive-optimade-integration for easy ingestion
  directly from static files, using the `optimade.yaml` file.
- Use the `optimake` CLI to create an OPTIMADE-compliant JSONL file, then insert into your db of choice and host it wherever you like...

## References

Paper with the source data:

> Merchant, A., Batzner, S., Schoenholz, S.S. et al. Scaling deep learning for materials discovery. Nature (2023). https://doi.org/10.1038/s41586-023-06735-9

OPTIMADE format/federation description:

> Andersen, C.W., Armiento, R., Blokhin, E. et al. OPTIMADE, an API for exchanging materials data. Sci Data 8, 217 (2021). https://doi.org/10.1038/s41597-021-00974-z

Tools used:

> Evans et al., (2021). optimade-python-tools: a Python library for serving and consuming materials data via OPTIMADE APIs. Journal of Open Source Software, 6(65), 3458, https://doi.org/10.21105/joss.03458
