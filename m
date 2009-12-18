From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2009 22:31:39 +0100
Subject: [Buildroot] External toolchain: crosstool-NG instead of
 buildroot?
In-Reply-To: <hgfudc$e2$1@ger.gmane.org>
References: <hgfudc$e2$1@ger.gmane.org>
Message-ID: <20091218223139.2118763c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 18 Dec 2009 13:00:28 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> The buildroot docs recommends using crosstool-NG to generate
> external toolchains.
> 
> Is there some reason one shouldn't or can't use a toolchain
> generated buildroot?

Theorically, Buildroot should work just as fine as Crosstool-NG for
generating toolchain.

In practive, my own *personal* feeling is that the Crosstool-NG
community is spending more time to improve this toolchain generation
tool than the Buildroot community spends on the toolchain part. I have
the impression that they do a better job at following new upstream
versions, integrating necessary patches, etc. But again, I have no
objective facts to validate these feelings.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
