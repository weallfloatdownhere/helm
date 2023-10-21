{{- define "webapp.name" -}}
{{- default .Chart.Name .Values.appname | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webapp.fullname" -}}
{{- default .Chart.Name .Values.appname | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webapp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "webapp.selectorLabels" -}}
webapp.kubernetes.io/name: {{ include "webapp.name" . }}
{{- end -}}

{{- define "webapp.labels" -}}
{{ include "webapp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
webapp.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
argocd.argoproj.io/managed-by: argocd
{{- end -}}