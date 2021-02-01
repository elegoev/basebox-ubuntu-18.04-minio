# copyright: 2021, Urs Voegele

title "check minio default environment"

# check /tmp directory
control "minio-env-1.0" do                  # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Check minio default environment"   # A human-readable title
  desc "Check minio default environment"
  describe file("/etc/default/minio") do    # The actual minio default environment
    it { should be_file }
  end
end
