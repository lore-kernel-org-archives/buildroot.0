From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Aug 2010 13:49:34 -0700
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <AANLkTi=Qrco8D8kFjh2FUehMO_gV5MMb-qA-qOJc+17-@mail.gmail.com>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
	<20100810182338.5c2b987c@surf>
	<AANLkTi=O6T5Moy50MCccGEx=_fL5KHLJ3bv39ogGn6AK@mail.gmail.com>
	<20100811155535.593127a3@surf>
	<AANLkTi=Qrco8D8kFjh2FUehMO_gV5MMb-qA-qOJc+17-@mail.gmail.com>
Message-ID: <20100811204934.GA8742@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On (11/08/10 16:19), Will Newton wrote:
> On Wed, Aug 11, 2010 at 2:55 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Wed, 11 Aug 2010 14:43:26 +0100
> > Will Newton <will.newton@gmail.com> wrote:

> 
> It should be fairly simple to reproduce with a clean cloned tree:
> 
> # make i686_defconfig
> # make menuconfig (switch compiler to 4.2.4)
> # make
> 

OK I could reproduce it with above. Here is patch for it
http://lists.busybox.net/pipermail/buildroot/2010-August/036783.html

test it and apply it if appropriate.

-Khem
