From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 20:43:07 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
In-Reply-To: <87blasr8ko.fsf@dell.be.48ers.dk>
References: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
 <87blasr8ko.fsf@dell.be.48ers.dk>
Message-ID: <20210405204307.7ebb5d7c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 05 Apr 2021 18:37:43 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >  AT91BOOTSTRAP_VERSION = 1.16
>  >  AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
>  >  AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
>  > +AT91BOOTSTRAP_LICENSE = BSD-Source-Code
>  > +AT91BOOTSTRAP_LICENSE_FILES = main.c  
> 
> Hmm, this doesn't work very well if someone patches main.c :/ But OK, I
> don't really know how common that is / what to do about it.

As Alexander pointed out, at91bootstrap (in this 1.x branch) is no
longer developed, so main.c will never be changed :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
