FROM vvakame/review:4.0

LABEL "com.github.actions.name"="Re:VIEW PDF Generator"
LABEL "com.github.actions.description"="builds PDF from Re:VIEW repository and uploads as Artifacts"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/mahiguch/review-pdf-generator-action"
LABEL "homepage"="https://github.com/mahiguch/review-pdf-generator-action"
LABEL "maintainer"="mahiguch <mahiguch2@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ADD copy_build_file.rb /copy_build_file.rb
ENTRYPOINT ["/entrypoint.sh"]
