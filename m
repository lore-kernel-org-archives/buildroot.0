From: Liam Staskawicz <liam@stask.net>
Date: Sun, 17 Jun 2018 14:30:14 -0700
Subject: [Buildroot] customizations to package recipes in BR2_EXTERNAL?
Message-ID: <4428F9BB-DCBB-42D1-AA6E-EFBE83730FD9@stask.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to slightly modify an existing package (nvidia-driver) to target a different version (not the latest version, just the specific version my project is using). The changes are simple - updating the version string, and .hash entries - but it's not clear how best to manage these changes in a BR2_EXTERNAL based workflow, as patches in BR2_GLOBAL_PATCH_DIR get applied after the sources have been downloaded and unpacked.

I'd like to avoid maintaining a clone of the buildroot repo with these changes, if possible. Is there a recommended workflow for this situation?

Thanks,
Liam
