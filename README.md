# optimade-gnome

*The first opioid-fueled OPTIMADE API as I recover from surgery, highly unofficial*

Taking some data from https://github.com/google-deepmind/materials_discovery and making it available as an OPTIMADE API, at least temporarily, at https://optimade_gnome.odbx.science (in progress), with the hope that deepmind pick it up.

The motivation is that this dataset can then be easily filtered by property and composition, returning structures that can be used by other labs (autonomous or otherwise), and also serendipitously, without needing to know which database to search in ahead of time.

Will use https://github.com/Materials-Consortia/optimade-python-tools and https://github.com/materialscloud-org/archive-optimade-integration (to be released soon)

## Process

- Clone with submodule.
- Download data using provided scripts in submodule, after `pip install -r requirements.txt` from this repo.
  python materials_discovery/scripts/download_data_wget.py
- Install the currently named archive-optimade-integration for easy ingestion
  directly from static files, using the `optimade.yaml` file.
- Use the `optimake` CLI to create an OPTIMADE-compliant JSONL file, then host
  it wherever you like...
