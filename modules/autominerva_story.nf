process autominerva_story {
  tag {"$meta.id"}
  label "process_low"
  input:
      tuple val(meta), file(image) 
  output:
      tuple val(meta), file(image), file('story.json')
  publishDir "$params.outdir",
      pattern: 'story.json',
      saveAs: {filename -> "${meta.id}/story.json"}
  stub: 
  """
  touch story.json
  """
  script:
  """
  python3 /auto-minerva/story.py $image > 'story.json'
  """
}
