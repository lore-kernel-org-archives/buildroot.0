From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:02:40 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: Bump to version 2.56.3
In-Reply-To: <20181230203445.GA24639@x230>
References: <20181207173836.13091-1-petr.vorel@gmail.com>
 <20181230193432.GA10930@x230> <20181230212745.196c01c3@windsurf>
 <20181230203445.GA24639@x230>
Message-ID: <20181230220240.5aee5473@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Sun, 30 Dec 2018 21:34:46 +0100, Petr Vorel wrote:

> Thanks for info. I've noticed this revert before. Problematic version was 2.58.1
> (updated from 2.56.1). That's why my commit only updated to 2.56.3 (latest
> 2.56.x), which should be ok.

Ah, thanks for spotting that. I didn't notice your bump was just to the
latest 2.56.x. Indeed, it should be much safer. Thanks for pointing it
out, I stupidly thought "it's the big glib bump that is again going to
break everything". I'll apply your patch right away.

Thanks for the reminder and additional explanation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
