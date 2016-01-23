From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 16:58:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <56a39930cd84_671a180a0ec59869@ultri2.mail>
References: <20160123154220.06518c9d@free-electrons.com>
 <56a39930cd84_671a180a0ec59869@ultri2.mail>
Message-ID: <20160123165816.05338d25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jan 2016 13:16:00 -0200, Ricardo Martincoski wrote:

> Just to be clear, removing the double quotes makes it work with
> patch 2.5.9 or later.
> Patch 2.5.4 can't handle spaces in filenames.
> (I tested using only the versions with tarballs available, that's the cause of
> the gap 2.5.9 -> 2.5.4, see http://ftp.gnu.org/gnu/patch/)

RHEL4 uses patch 2.5.4
(http://ftp.redhat.com/pub/redhat/linux/enterprise/4/en/os/i386/SRPMS/).
RHEL4 was released January 2005

RHEL5 also seems to be using patch 2.5.4
(http://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/).
RHEL5 was released March 2007.

It's only starting at RHEL6 that patch 2.6 starts to be used
(http://ftp.redhat.com/pub/redhat/linux/enterprise/6Client/en/os/SRPMS/).
RHEL6 was released November 2010.

Thomas DS, you are one of our users relying on very old enterprise
distros. Are you still on RHEL 4/5 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
