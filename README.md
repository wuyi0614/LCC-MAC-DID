# LCC-MAC-DID

This repository is a library for data, codes and organisational materials applied in finishing the research about the MAC-computing based difference-in-difference model identification for Chinese Low-Carbon City Pilots.

> [!WARNING]
> COMMIT IT! Every time you make important changes even when they're experimental. 

### TODOs

Frequently update and put your thoughts in this section so that everyone reads your mind and know what to do next. Follow the rule by: `- [ ] <task> @yiwu` to assign specific tasks to person. 

**General**

- [ ] Clean data and merge with the energy consumption data provided by CEADs @zyx
- [ ] Redesign the outline (`/doc/outline.docx`) according to the existing literature @yiwu
- [ ] Build the repo for VCS and data management for publication @yiwu
- [ ] Find a proper target journal @all

**Stata**

- [ ] Rename and make variables consistent and as clear as possible for using @all

**Matlab**

- [ ] Update and upload matlab codes @zyx

### Data structure

All the processing data should be included in the folder `/data` and version control system is used to control version dynamics, including minor adjustments on the datasets. In this case, make sure each datafile contains a timestamp in its filename and carefully avoid any conflicts when various branches were created. 

```text
data 
	- city-panel-yyyyddmm.xlsx
	- macc-yyyyddmm.xlsx
	- <the-other-processing-dataset>-yyyyddmm.xlsx
```

Notably, `/stats` saves every dofile from stata and DO NOT create `.dta` for processing and just use `.xlsx` files and keep the loading path clean in your scripts. Following the recommendations, the structure of dofiles should be like:

```text
stats
	- main.do [run sub-commands here]
	- reg1.do [the script for creating regression results in the 1st section]
	- regX.do [the others]
	- results [a folder]
		- reg1.doc [better to use esttab or logout to export results in .doc]
		- ... ...

```

### Repo structure

This repo is organised the same as the other repos and it has a strict tree system for files. 

```text
LCC-MAC-DID
	- data [vcs]
	- doc [vcs]
		- manuscript-yiwu.docx
		- manuscript-zyx.docx
		- supplementary-yiwu.docx [draft it with manuscript!]
		- ... ... 
	- refs [will not be uploaded]
	- <code>.py [python scripts should be put in the main folder]
	- stats
		- main.do [stata scripts should be put in the /stats folder]
	- matlab [put matlab-related files here]
		- compute.m
		- compute.xlsx [processing excel datafiles]
	- README.md
```

Keep in mind updating `README.md` so that everyone follows the changes in tasks and progress. 
