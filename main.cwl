class: Workflow
cwlVersion: sbg:draft-2
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': thucmi@synapse.org,
  'foaf:name': thucmi}
description: Fusion Detection Validator/Evaluator workflow
doc: 'SMC-RNA challenge fusion detection submission

  '
hints: []
id: https://cgc-api.sbgenomics.com/v2/apps/thuc_le/copy-of-icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/1/raw/
inputs:
- id: '#gtf'
  label: gtf
  sbg:fileTypes: TXT
  sbg:x: 97
  sbg:y: 321.99652099609375
  type: [File]
- id: '#input'
  label: input
  sbg:fileTypes: BEDPE
  sbg:x: 196
  sbg:y: 214.99652099609375
  type: [File]
- id: '#truth'
  label: truth
  sbg:fileTypes: BEDPE
  sbg:x: 98
  sbg:y: 115.99652099609375
  type: [File]
label: DREAM Fusion Detection Evaluation Workflow
outputs:
- id: '#output'
  label: output
  required: false
  sbg:includeInPorts: true
  sbg:x: 716
  sbg:y: 217.99652099609375
  source: ['#FusionEvaluator.output']
  type: ['null', File]
requirements: []
sbg:canvas_x: 0
sbg:canvas_y: 0
sbg:canvas_zoom: 1
sbg:categories: [DREAM]
sbg:contributors: [thuc_le]
sbg:copyOf: gauravCGC/icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/1
sbg:createdBy: thuc_le
sbg:createdOn: 1487390729
sbg:id: thuc_le/copy-of-icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/1
sbg:image_url: null
sbg:latestRevision: 1
sbg:modifiedBy: thuc_le
sbg:modifiedOn: 1487390729
sbg:project: thuc_le/copy-of-icgc-tcga-dream-somatic-mutation-calling-challenge-rna
sbg:projectName: Copy of ICGC-TCGA DREAM Somatic Mutation Calling Challenge - RNA
sbg:revision: 1
sbg:revisionNotes: Copy of gauravCGC/icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/1
sbg:revisionsInfo:
- {'sbg:modifiedBy': thuc_le, 'sbg:modifiedOn': 1487390729, 'sbg:revision': 0, 'sbg:revisionNotes': Copy
    of gauravCGC/icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/0}
- {'sbg:modifiedBy': thuc_le, 'sbg:modifiedOn': 1487390729, 'sbg:revision': 1, 'sbg:revisionNotes': Copy
    of gauravCGC/icgc-tcga-dream-somatic-mutation-calling-challenge-rna/dream-fusion-detection-evaluation-workflow/1}
sbg:sbgMaintained: false
sbg:toolAuthor: Thomas Yu, Ryan Spangler, Kyle Ellrott
sbg:toolkit: DREAM-Evaluate
sbg:validationErrors: []
steps:
- id: '#FusionEvaluator'
  inputs:
  - id: '#FusionEvaluator.truth'
    source: ['#truth']
  - id: '#FusionEvaluator.input'
    source: ['#input']
  - id: '#FusionEvaluator.gtf'
    source: ['#gtf']
  outputs:
  - {id: '#FusionEvaluator.output'}
  run:
    arguments: []
    baseCommand: [evaluation.py, evaluateFusionDet]
    class: CommandLineTool
    cwlVersion: sbg:draft-2
    description: Fusion Detection validation and evaluation
    hints:
    - {class: 'sbg:CPURequirement', value: 1}
    - {class: 'sbg:MemRequirement', value: 1000}
    - {class: DockerRequirement, dockerImageId: '', dockerPull: 'dreamchallenge/smcrna-functions:latest'}
    id: https://cgc-api.sbgenomics.com/v2/apps/gauravCGC/dream-project/fusionevaluator/9/raw/
    inputs:
    - description: Use truth.bedpe for DREAM evaluation
      id: '#truth'
      inputBinding: {position: 1, prefix: --truth, 'sbg:cmdInclude': true, separate: true}
      sbg:category: Evaluate
      sbg:fileTypes: BEDPE
      type: [File]
    - id: '#input'
      inputBinding: {position: 1, prefix: --input, 'sbg:cmdInclude': true, separate: true}
      sbg:fileTypes: BEDPE
      type: [File]
    - description: Use ensembl.hg19.txt for DREAM Evaluation
      id: '#gtf'
      inputBinding: {position: 1, prefix: --gtf, 'sbg:cmdInclude': true, separate: true}
      sbg:category: Evaluate
      sbg:fileTypes: TXT
      sbg:toolDefaultValue: TXT
      type: [File]
    label: FusionEvaluator
    outputs:
    - id: '#output'
      outputBinding: {glob: result.out}
      type: ['null', File]
    requirements: []
    sbg:categories: [DREAM]
    sbg:cmdPreview: evaluation.py evaluateFusionDet --truth /path/to/truth.ext --input
      /path/to/input.ext --gtf /path/to/gtf.ext
    sbg:contributors: [gauravCGC]
    sbg:createdBy: gauravCGC
    sbg:createdOn: 1465755583
    sbg:id: gauravCGC/dream-project/fusionevaluator/9
    sbg:image_url: null
    sbg:job:
      allocatedResources: {cpu: 1, mem: 1000}
      inputs:
        gtf:
          class: File
          path: /path/to/gtf.ext
          secondaryFiles: []
          size: 0
        input:
          class: File
          path: /path/to/input.ext
          secondaryFiles: []
          size: 0
        truth:
          class: File
          path: /path/to/truth.ext
          secondaryFiles: []
          size: 0
    sbg:latestRevision: 9
    sbg:modifiedBy: gauravCGC
    sbg:modifiedOn: 1469048195
    sbg:project: gauravCGC/dream-project
    sbg:revision: 9
    sbg:revisionsInfo:
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465755583, 'sbg:revision': 0,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465755766, 'sbg:revision': 1,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465755883, 'sbg:revision': 2,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465755937, 'sbg:revision': 3,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465756042, 'sbg:revision': 4,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465756103, 'sbg:revision': 5,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1465756152, 'sbg:revision': 6,
      'sbg:revisionNotes': null}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1468249291, 'sbg:revision': 7,
      'sbg:revisionNotes': Added 'latest' tag to Docker container}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1469048006, 'sbg:revision': 8,
      'sbg:revisionNotes': 'Updated to include input filename as prefix to output
        file, and inherit metadata from input.'}
    - {'sbg:modifiedBy': gauravCGC, 'sbg:modifiedOn': 1469048195, 'sbg:revision': 9,
      'sbg:revisionNotes': null}
    sbg:sbgMaintained: false
    sbg:toolkit: DREAM
    sbg:validationErrors: []
    stdin: ''
    stdout: ''
    successCodes: []
    temporaryFailCodes: []
  sbg:x: 448
  sbg:y: 217.2847137451172
