From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 26 Jun 2016 16:03:13 -0400
Subject: [Buildroot] [PATCH v5] *** Update selinux libraries ***
Message-ID: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many of the packages in buildroot pertaining to selinux are woefully
out of date.  This patch series focuses on bringing these packages
up to date with the current releases.  

In addition, it also adds host compilation to libcap-ng and audit
in anticipation for the new package refpolicy and policycoreutils which
will require host-audit (and host-audit requires host-libcap-ng).


Adam Duskett (1):
  [1/8,v5] libcap-ng: Allow host compilation.
  [2/8,v5] audit: bump to version 2.6
  [3/8,v5] audit: Add the ability to compile as a host package.
  [4/8,v5] libsemanage: bump to version 2.5
  [5/8,v5] checkpolicy: bump to version 2.5
  [6/8,v5] libselinux: bump to version 2.5
  [7/8,v5] libsepol: bump to version 2.5
  [8/8,v5] setools: fix build with latest selinux libraries.
 
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4
