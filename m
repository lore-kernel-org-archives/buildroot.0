From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Jun 2020 11:19:56 +0200
Subject: [Buildroot] [PATCH] package/fastd: bump to v19
In-Reply-To: <20200618221558.bjtrlxvwco7cpg6p@falbala.internal.home.lespocky.de>
References: <20200611192504.4058-1-post@lespocky.de>
 <20200618224002.4da2ed12@windsurf.home>
 <20200618221558.bjtrlxvwco7cpg6p@falbala.internal.home.lespocky.de>
Message-ID: <20200619111956.32518740@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Fri, 19 Jun 2020 00:15:59 +0200
Alexander Dahl <post@lespocky.de> wrote:

> > You had forgotten to update the hash of the license file (and explain
> > why it needs to be updated). I fixed that and applied. Thanks!  
> 
> I did not really forget it, but there was no error or warning on
> mismatch on my side. Maybe I did not let the whole BSP build finish,
> but just called some intermediate state before that was checked. Will
> check next time. Thanks for fixing it.

The hash of license files is checked when you run:

$ make legal-info

or if you want to do it just for one package:

$ make <pkg>-legal-info

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
