From: Rajeev Bansal <rbansal@proxim.com>
Date: Tue, 10 Mar 2009 09:55:17 -0700
Subject: [Buildroot] MIPS32 toolchain with NPTL support
In-Reply-To: <20090310100925.595b865a@surf>
Message-ID: <1E3D081C7B502B4A988F643E604CF9634B981F@INDEXCH.corp.proxim.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your help. I will definitely try this.

Thanks
Rajeev Bansal. 

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Tuesday, March 10, 2009 2:39 PM
To: buildroot at busybox.net
Subject: Re: [Buildroot] MIPS32 toolchain with NPTL support

Hi,

Le Mon, 9 Mar 2009 18:51:08 -0700,
"Rajeev Bansal" <rbansal@proxim.com> a ?crit :

> I am looking for a Linux cross toolchain for MIPS32 architecture with 
> NPTL support, so please help me how can I build it or from where I can 
> get it? I came to know uclibc doesn't have the support for NPTL, so 
> glibc will also OK for me.

Buildroot only allows to generate uclibc-based toolchains. You may want to try crosstool-ng <http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool>.

Sincerly,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
