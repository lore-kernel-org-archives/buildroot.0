From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:21:05 +0200
Subject: [Buildroot] [PATCH 1/1] feh: Fix dependency name
In-Reply-To: <20180912191433.16266-1-petr.vorel@gmail.com>
References: <20180912191433.16266-1-petr.vorel@gmail.com>
Message-ID: <20180912212105.41236163@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 21:14:33 +0200, Petr Vorel wrote:
> Fixes: de2fe74e2a feh: xinemara is optional not mandatory
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Gaah, our e-mails keep crossing each other. I saw your v2, but too
late, as I had already applied the v1 from Fabrice. When I saw your v2,
I immediately fixed the dependency myself. And then I see this patch.

Sorry, and thanks for noticing the problem :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
