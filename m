From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sat, 7 Jan 2017 04:03:12 +0100
Subject: [Buildroot] Kernel and u-boot tarballs with same name
Message-ID: <4b4b1204-d0c2-b62f-275d-4fd5220b6cc3@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I just stumbled about a weird build failure.
I am using Xilinx' linux kernel and u-boot from their github:
https://github.com/Xilinx/linux-xlnx and
https://github.com/Xilinx/u-boot-xlnx

They provide release tarballs both named like this:
xilinx-v2016.4.tar.gz. Exactly the same for the kernel and u-boot.
Buildroot now tries build the extracted kernel as u-boot which gave me a
very confusing failure during configure.

What would be the recommended approach here? I guess there is no way to
provide a 'save as' name for a tarball?
For now I changed back to checking out the git repo.

Best wishes,
Marcus
