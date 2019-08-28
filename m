From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Aug 2019 14:46:48 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: more upstream names
In-Reply-To: <20190828070251.22886-2-francois.perrad@gadz.org>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20190828070251.22886-2-francois.perrad@gadz.org>
Message-ID: <20190828144648.1f4f0925@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

+Victor Huesca in Cc.

On Wed, 28 Aug 2019 09:02:51 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> the python infrastructure populates the variables _NAME_UPSTREAM
> (like the luarocks one).
> and pkg-stats uses them.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I think this should be split into two parts:

 - one changing pkg-stats to use NAME_UPSTREAM, as it already helps for
   luarocks-package. However, could you name a few luarocks packages
   where their NAME_UPSTREAM matches the name of the project on
   release-monitoring.org ?

 - for the Python case, what should "upstream name" match ? The name
   registered on PyPi ? Sometimes the name registered on PyPi doesn't
   always exactly match the upstream name.

   In any case, the new NAME_UPSTREAM variable in python-package should
   be documented in the manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
