From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 13:43:13 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <1437737186.9920.4.camel@embedded.rocks>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
 <20150724091742.669aaf4a@free-electrons.com>
 <1437729695.20708.9.camel@embedded.rocks>
 <20150724113147.28d69deb@free-electrons.com>
 <1437737186.9920.4.camel@embedded.rocks>
Message-ID: <20150724134313.131f6b37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 24 Jul 2015 13:26:26 +0200, J?rg Krause wrote:

> It's implemented in auth_des.c which we removed from building with
> patch #1.
> 
> gentoo has a patch removing authdes_create(), too [1].
> 
> [1]
> https://gitweb.gentoo.org/proj/hardened-dev.git/diff/net
> -libs/libtirpc/files/0007-no-des.patch?id=74727efe

Ok, so I guess you will submit a patch to fix this issue?

Thakns!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
