# Lesson Planner Prototype

NOTE: This is experimental and proof-of-concept code

This demonstration code brings together the functionality of https://github.com/nsip/curriculum-align and https://github.com/nsip/resource-align, to demonstrate how a lesson plan authoring system can incorporate suggestions of related curriculum statements and resources.

To execute the code, download a build specific to your computer from build/, unzip the file, and execute the top-level executable, `lesson-planner-prototype` or `lesson-planner-prototype.exe`. Then:

* Go to http://localhost:1576 on a web browser.
* Select a Learning Area.
* Select one or more Year Levels (optional).
  * Note that the curriculum included in the binary distribution includes only Science for Years 7 and 8; selecting Learning Areas or Year Levels outside of those will return an error. The curriculum can be replaced by your own JSON files under `curriculum/`, so long as they conform to the specification in https://github.com/nsip/curriculum-align.
* Type some text in the text box; this will be the lesson plan text which the code will attempt to align curriculum statements to
* Click "Get Curriculum". After a couple of seconds of one-off initialisation, this will display a list of up to 10 curriculum statements, ranked by best alignment to the lesson plan text.
  * You can update the lesson plan text and re-click "Get Curriculum" at any time.
* Select one or more of the returned curriculum statements. These will be the curriculum statements you wish your lesson plan to be aligned to.
* Click "Get Resources". This will display a list of up to 10 resources, ranked by best alignment to the curriculum statements you have selected, and the lesson plan learning area and year levels.
  * The resources are drawn from a dummy repository whose definition is included in the binary distribution. The repository definition can be replaced by your own JSON files under `repository/`, so long as they conform to the specification in https://github.com/nsip/resource-align.
* Select one or more of the returned resource descriptions. These will be the resources you wish your lesson plan to be aligned to.
* Click "Save Lesson Plan". This will save to disk (with the filename `lessonplan.txt`) the text of your lesson plan, prefaced by a listing of the learning area, year levels, curriculum statements and resources that you have selected.
