From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  2 Nov 2017 11:45:16 +0100
Subject: [Buildroot] [PATCH 0/4] Fix BR2_HOSTARCH_NEEDS_IA32_* autobuilder
 issues
Message-ID: <20171102104520.29257-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The following patch series fixes various autobuilder issues from packages
selecting BR2_HOSTARCH_NEEDS_IA32_* without ensuring hostarch is x86(-64),
breaking the build on the gcc112 ppc64le autobuilder.

--
Bye, Peter Korsgaard
