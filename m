From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 20:14:12 +0200
Subject: [Buildroot] [PATCH 2/7] dtc: add host build
In-Reply-To: <1443901457-7914-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:12 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8ryjybv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Peter Seiderer <ps.report@gmx.net>
 > Having a host variant of dtc is needed for example for U-Boot, which
 > uses the Device Tree for a number of platforms.

 > In addition, now that we have a proper host-dtc package, it is no
 > longer needed for the linux package to install the host dtc compiler:
 > users interested in having the host dtc compiler can simply enable
 > this package.

 > A Config.in.host option is added to build host-dtc, because the
 > initial reason why the host DTC built by the kernel was installed in
 > $(HOST_DIR)/usr/bin (commit 707d44d0a28906ebda49584dd5f55985406f0bde
 > from Thomas DS) was:

 >     Having dtc as a host tool can be useful for users that have a
 >     custom boot scenario where the device tree is not embedded in the
 >     kernel.

 > [Thomas:
 >   - remove the linux installation of host dtc.
 >   - rework the commit log.]

Committed with the linux.mk part dropped, thanks.

-- 
Bye, Peter Korsgaard
