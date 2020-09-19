From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:50:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: fix passing of
 make opts and add snappy dep
In-Reply-To: <20200919091313.29175-1-egorenar-dev@posteo.net>
References: <20200919091313.29175-1-egorenar-dev@posteo.net>
Message-ID: <20200919145006.7a36a671@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Sep 2020 11:13:13 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Since this patch was doing two different things, I split it into two
patches, which I applied. I also did two other minor fixes/improvements
as separate patches.

See:

5b05b0c82ba835282f5b27eb6427faa5fc6514fd package/makedumpfile: add optional dependency on snappy
301f746629de3c01fa5ad4290c273043a49df69f package/makedumpfile: pass all options through MAKEDUMPFILE_MAKE_OPTS
24ed3fef9d07ae5695cc631600eca421a21330b8 package/makedumpfile: remove consecutive empty lines
660692939cf6bd13fd0c822083f1fd4b0fafca1c package/makedumpfile: fix passing of MAKEDUMPFILE_MAKE_OPTS

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
