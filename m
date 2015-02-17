From: David Kessler <djkessler@utexas.edu>
Date: Tue, 17 Feb 2015 16:38:15 -0600
Subject: [Buildroot] How to avoid rebuilding host-cmake
Message-ID: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am trying to reduce the amount of time it takes to rebuild the linux kernel and its dependencies.  I am already using the external toolchain option (toolchain was originally built using buildroot, but in an external directory) so I?m not rebuilding the toolchain unnecessarily. However, for some reason after doing ?make clean?, host-cmake has to be rebuilt. For my configuration host-cmake is the most time consuming part of the build.

Is there a way that I can avoid having to rebuilding host-cmake after doing a make clean?

Thanks,
David Kessler?
