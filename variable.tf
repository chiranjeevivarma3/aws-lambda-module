variable "function_name" {
  description = "A unique name for your Lambda Function"
  type        = string

}

variable "handler" {
  description = "Lambda Function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "Lambda Function runtime"
  type        = string
}
variable "source_path" {
  description = "The absolute path to a local file or directory containing your Lambda source code"
  type        = string
}
