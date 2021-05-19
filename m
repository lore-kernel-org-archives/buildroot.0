From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Date: Wed, 19 May 2021 21:44:45 +0200
Subject: [Buildroot] [PATCH 1/3] boot/at91bootstrap3: add support for
 at91bootstrap 4.x series
In-Reply-To: <20210519120237.52ddc109@windsurf.orange-hotspot>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-2-thomas.petazzoni@bootlin.com>
 <20210519093323.GL2268078@scaer>
 <20210519120237.52ddc109@windsurf.orange-hotspot>
Message-ID: <67f43b07-1fc8-2eeb-9f3c-947f4b695d1e@grenoble.cnrs.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Thomas Petazzoni wrote:
> I think we should ask the contributor of these defconfigs to use a
> fixed version of AT91Bootstrap, because that's normally what we do for
> bootloader/kernel versions in defconfigs.

Oh, right, I hadn't noticed. Sorry for the mess. I just submitted a
patch to pin these defconfifs to at91bootstrap 3.10.2, which I tested.

Best regards,

Edgar Bonet.
