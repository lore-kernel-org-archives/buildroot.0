From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:32:45 +0200
Subject: [Buildroot] [PATCH] pppd: use uclibc libcrypt instead of openssl
In-Reply-To: <20190906163107.GA5121@hpx>
References: <20190906101849.4621-1-alexander.i.mukhin@gmail.com>
 <20190906133541.5707ade0@windsurf> <20190906163107.GA5121@hpx>
Message-ID: <20190907143245.22f1dc70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Fri, 6 Sep 2019 19:31:07 +0300
Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

> On Fri, Sep 06, 2019 at 01:35:41PM +0200, Thomas Petazzoni wrote:
> > I am surprised: which functions are provided by uClibc that glibc
> > doesn't provide ?  
> 
> According to Fabrice Fontaine's commit 541021, glibc since 2.28 dropped
> support for DES encryption functions encrypt(), setkey(), etc. But
> uclibc still provides them.

OK, thanks for the additional details. Could you send an updated
version which explains this in the commit log ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
