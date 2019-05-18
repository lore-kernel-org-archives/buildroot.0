From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:32:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/libupnp18: needs host-pkgconf
In-Reply-To: <20190509110438.31340-1-joerg.krause@embedded.rocks>
References: <20190509110438.31340-1-joerg.krause@embedded.rocks>
Message-ID: <20190518233239.57a4045d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 May 2019 13:04:37 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Otherwise build fails with:
> 
> ```
> configure.ac:630: error: possibly undefined macro: AC_MSG_ERROR
>       If this token and others are legitimate, please use m4_pattern_allow.
> ```
> 

You forgot to add a reference to the autobuilder failure that this
commit fixes, so I've added it and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
