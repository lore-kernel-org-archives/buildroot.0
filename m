From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 09:05:04 +0100
Subject: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version
 1.7.990
In-Reply-To: <361202886.84859.1518998584797.JavaMail.zimbra@datacom.ind.br>
References: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518799091-845-2-git-send-email-jared.bents@rockwellcollins.com>
 <20180216215334.7385e898@windsurf.lan>
 <361202886.84859.1518998584797.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180219090504.745c4841@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Feb 2018 21:03:04 -0300 (BRT), Carlos Santos wrote:

> > Are you sure 1.7.990 isn't a development version ? Interestingly, their
> > Git repo has no tag with this name:
> > https://cgit.freedesktop.org/ModemManager/ModemManager/refs/tags. It
> > has a 1.8-rc1 version. So it does feel like 1.7.x might be a
> > development version. Could you double check this ?  
> 
> It is a development version. That's why I submitted an update to the
> latest release version, which is 1.6.12:
> 
>     https://patchwork.ozlabs.org/patch/871059/

When is the final 1.8.x version expected ? If it's in the very near
future (i.e before 2018.05-rc1), then we could accept the 1.7.x bump for
now, and move to 1.8.x when it lands. Otherwise, I'd prefer to stick
with 1.6.x for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
