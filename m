From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 23:16:17 +0200
Subject: [Buildroot] [PATCH] collectl: new package
In-Reply-To: <20190918181937.2241-1-francois.perrad@gadz.org>
References: <20190918181937.2241-1-francois.perrad@gadz.org>
Message-ID: <20190919231617.1c63e8be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 18 Sep 2019 20:19:37 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I've applied to master, but two comments:

 - The prefix of the commit title should have been package/collectl

 - You forgot to propagate the depends on BR2_USE_MMU dependency of
   perl, which you need since you're selecting BR2_PACKAGE_PERL.

I fixed those two issues before applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
