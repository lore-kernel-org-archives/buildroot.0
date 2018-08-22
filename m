From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:46:51 +0200
Subject: [Buildroot] [PATCH next 2/4] e2fsprogs: build shared library
 for the host
In-Reply-To: <20180821221141.GU15347@scaer>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
 <20180821215954.11971-3-thomas.petazzoni@bootlin.com>
 <20180821221141.GU15347@scaer>
Message-ID: <20180822134651.64f35c4c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 00:11:41 +0200, Yann E. MORIN wrote:

> I lknow this is not your fault, but I find it more readable when the
> --disable are all grouped together, and the --enable ones as well.
> 
> It also helps spot potentialy issues when the ordering is the same btw
> host and target variants.

I have pushed an additional commit fixing this for the host configure
options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
