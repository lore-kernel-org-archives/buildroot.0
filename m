From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 14:42:23 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
In-Reply-To: <87vb4pchjr.fsf@dell.be.48ers.dk>
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
 <56E5E786.1090906@mind.be> <87vb4pchjr.fsf@dell.be.48ers.dk>
Message-ID: <20160314144223.3da7b2ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Mar 2016 14:31:20 +0100, Peter Korsgaard wrote:

>  >  But we have a simple solution now: kodi depends on
>  > BR2_HOST_GCC_AT_LEAST_4_7. Cfr. nodejs for instance, which faces the
>  > same problem.
> 
> Indeed. And gcc10 uses host-gcc 4.4:

I'm also using gcc 4.4 on Free Electrons build server. Well, I should
say that our machine is not using such an ancient system (we have a
reasonably recent Ubuntu 14.04 with gcc 4.8), but I run the Buildroot
builds in an intentionally old Debian 6.0 chroot, which has this old
4.4 gcc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
