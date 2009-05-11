From: Cliff Holden <Cliff.Holden@Atheros.com>
Date: Mon, 11 May 2009 10:53:32 -0700
Subject: [Buildroot] Using an external Linux tree
Message-ID: <D302D58E77B2A2448F54114C6F143271EC45E9F17E@SC1EXMB-MBCL.global.atheros.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm somewhat new to buildroot, but have been building kernels for a while.  I have a general question:

What is the proper procedure for using an external linux kernel tree in the build?  Our SCC system (source code control) is set up to have various kernel versions located in a particular location.  If I could get buildroot to "point" to this external kernel, it would be helpful.

I did try the "advanced" options that allows the specification of a kernel version and an external "patch" file, which is close, but the custom kernel I have is not set up as a set of patches.  I would like an option to simply specify the path of the kernel source for the build to use.

Any suggestions would be appreciated.

Thanks!!

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090511/f58222cd/attachment.htm>
