# copyright: 2021, Urs Voegele

title "check minio"

# check docker service
control "minio-1.0" do                      # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "check if minio is running"         # A human-readable title
  desc "check minio service"
  describe service('minio') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
