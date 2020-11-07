From: Graham Leva <celaxodon@gmail.com>
Date: Fri,  6 Nov 2020 18:29:24 -0600
Subject: [Buildroot] [PATCH 0/1] package/linux-nvidia for Jetson Nano SD
Message-ID: <20201107002925.6561-1-celaxodon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I would like to submit some packages to support building NVIDIA's Jetson
line of boards, beginning with the Jetson Nano 4GB developer module. This
will be the the first of roughly 10 commits -- 9 packages for various
code repositories for building NVIDIA's Linux for Tegra kernel and an
additional commit for the board/nvidia files and defconfig. 

I wasn't sure whether or not to submit this as a patch series or
as standalone patches. Happy to resubmit if the preference
is for a patch series.

While this is not an officially supported project by NVIDIA, I
have received approval from legal and management for these patches.

I also wanted to say that I've become a big fan of Buildroot after
creating this port. This is an excellent project, and I've learned a
tremendous amount from it. Thank you for all the hard work!

Kind regards,
Graham Leva

Graham Leva (1):
  package/linux-nvidia: add nvidia linux kernel extensions package

 DEVELOPERS                             |  3 +++
 linux/Config.ext.in                    | 10 ++++++++++
 package/Config.in                      |  1 +
 package/linux-nvidia/Config.in         |  7 +++++++
 package/linux-nvidia/linux-nvidia.hash |  2 ++
 package/linux-nvidia/linux-nvidia.mk   | 20 ++++++++++++++++++++
 6 files changed, 43 insertions(+)
 create mode 100644 package/linux-nvidia/Config.in
 create mode 100644 package/linux-nvidia/linux-nvidia.hash
 create mode 100644 package/linux-nvidia/linux-nvidia.mk

-- 
2.17.1
