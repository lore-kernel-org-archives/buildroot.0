From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:52:43 +0200
Subject: [Buildroot] [PATCH v2 2/2] modem-manager: Update to version
 1.7.990
In-Reply-To: <2137381520.124019.1519075425250.JavaMail.zimbra@datacom.ind.br>
References: <1518799091-845-1-git-send-email-jared.bents@rockwellcollins.com>
 <1518799091-845-2-git-send-email-jared.bents@rockwellcollins.com>
 <20180216215334.7385e898@windsurf.lan>
 <361202886.84859.1518998584797.JavaMail.zimbra@datacom.ind.br>
 <20180219090504.745c4841@windsurf.lan>
 <2137381520.124019.1519075425250.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180402005243.00aea819@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Feb 2018 18:23:45 -0300 (BRT), Carlos Santos wrote:

> The announcement message[1], from Sun Jan 21, informs that 1.7.990
> corresponds to 1.8-rc1. From the list of 1.5.99x releases, which spans
> several months, I believe that 1.8 will unlikely be released before
> the end of February.

Then we'll wait for the final 1.8 release to be made before bumping. We
don't typically package release candidate versions in Buildroot.

If people are unhappy with this, I would suggest to work with upstream
so that they adopt a more regular release schedule, so that
modem-manager users can get new features on a more regular basis,
without having to use release candidates.

I've marked the patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
