From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:42:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <CA+h8R2qWhbuQj_weOPZk9NeR2C_9CQ1zAZfogtO69og5Eyqs5A@mail.gmail.com>
References: <20200808173800.2034897-1-christian@paral.in>
 <20200813232744.12d34e1b@windsurf.home>
 <CA+h8R2qWhbuQj_weOPZk9NeR2C_9CQ1zAZfogtO69og5Eyqs5A@mail.gmail.com>
Message-ID: <20200813234209.3b6dd3e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 14:31:26 -0700
Christian Stewart <christian@paral.in> wrote:

> > Applied to master, thanks. I have to say the snippet of code that is
> > being patched here does not give a very good feel of the rtl8821au
> > code base :-/  
> 
> After years of struggling with USB rtl cards (and helping others do
> the same) I have to agree.

And nobody ever thought of taking all these crappy out of tree WiFi
drivers, submit them for drivers/staging/ inclusion in the upstream
kernel, and progressively clean them up ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
