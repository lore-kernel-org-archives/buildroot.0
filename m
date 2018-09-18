From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:21:13 +0200
Subject: [Buildroot] [PATCH 1/1] host-tzdump: bump to version
 e1a52ce12a701b8ea4163d6719713e38c0e53d35
In-Reply-To: <20180918134021.7878-1-m.patzlaff@pilz.de>
References: <20180918134021.7878-1-m.patzlaff@pilz.de>
Message-ID: <20180918212113.309f5d9f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 15:40:21 +0200, Marcel Patzlaff wrote:
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>

I've applied, but after tweaking two small things:

 - The commit title should mention "tzdump", not "host-tzdump". We
   never indicate in the commit title if it's a host or a target
   package (or both)

 - Since you're bumping from a random Git commit to another random Git
   commit, it's a good idea to explain a bit in the commit log the
   motivation for the change. I did that by adding the (small) list of
   upstream commits done between the old version and the new version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
