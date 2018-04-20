From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 16:08:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: needs readline
In-Reply-To: <20180420122013.43fbd215@windsurf.numericable.fr>
References: <20180113224532.2715-1-bernd.kuhls@t-online.de>
 <20180114053204.qzh6l3xgqywgcmyr@sapphire.tkos.co.il>
 <ver4jexs69.ln2@ID-313208.user.individual.net>
 <20180118044042.4cclk2qlu6fb37ha@tarshish>
 <1520024398.13943.5.camel@embedded.rocks>
 <20180420122013.43fbd215@windsurf.numericable.fr>
Message-ID: <20180420160835.263e4ee3@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 12:20:13 +0200, Thomas Petazzoni wrote:

> > Any news on this issue? Would be great to have this fixed before the
> > next release.  
> 
> I've sent an e-mail to upstream about this:
> 
>   https://marc.info/?l=linux-bluetooth&m=152421846903323&w=2
> 
> Let's see if they answer, and what they answer.

They answered, and proposed a patch to fix it, which works. I've
submitted a Buildroot patch to integrate it:

  https://patchwork.ozlabs.org/patch/901944/

And therefore I'll mark the older patch proposed by Bernd as Superseded.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
