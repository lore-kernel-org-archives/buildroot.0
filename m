From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:44:24 +0200
Subject: [Buildroot] [PATCH 4/5] dropbear: add option to disable CBC
 mode ciphers
In-Reply-To: <20180704070739.7259-5-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-5-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704214424.6f77fb53@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 09:07:38 +0200, Thomas De Schampheleire wrote:
> CBC mode ciphers are considered insecure. Add an option to disable it.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Following the discussion with Baruch, I have marked this patch and
PATCH 5/5 as Rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
