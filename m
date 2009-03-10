From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2009 10:09:25 +0100
Subject: [Buildroot] MIPS32 toolchain with NPTL support
In-Reply-To: <1E3D081C7B502B4A988F643E604CF9634B96D4@INDEXCH.corp.proxim.com>
References: <1E3D081C7B502B4A988F643E604CF9634B96D4@INDEXCH.corp.proxim.com>
Message-ID: <20090310100925.595b865a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Mon, 9 Mar 2009 18:51:08 -0700,
"Rajeev Bansal" <rbansal@proxim.com> a ?crit :

> I am looking for a Linux cross toolchain for MIPS32 architecture with
> NPTL support, so please help me how can I build it or from where I can
> get it? I came to know uclibc doesn't have the support for NPTL, so
> glibc will also OK for me. 

Buildroot only allows to generate uclibc-based toolchains. You may want
to try crosstool-ng
<http://ymorin.is-a-geek.org/dokuwiki/projects/crosstool>.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
