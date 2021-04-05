From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 21:07:53 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
In-Reply-To: <20210405204307.7ebb5d7c@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 5 Apr 2021 20:43:07 +0200")
References: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
 <87blasr8ko.fsf@dell.be.48ers.dk>
 <20210405204307.7ebb5d7c@windsurf.home>
Message-ID: <877dlgr1me.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 05 Apr 2021 18:37:43 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >  AT91BOOTSTRAP_VERSION = 1.16
 >> >  AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
 >> >  AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 >> > +AT91BOOTSTRAP_LICENSE = BSD-Source-Code
 >> > +AT91BOOTSTRAP_LICENSE_FILES = main.c  
 >> 
 >> Hmm, this doesn't work very well if someone patches main.c :/ But OK, I
 >> don't really know how common that is / what to do about it.

 > As Alexander pointed out, at91bootstrap (in this 1.x branch) is no
 > longer developed, so main.c will never be changed :)

"Never" is probably a bit too strong. I know I have done it in the past,
and there's even a bootlin blog entry about doing it ;)

https://bootlin.com/blog/at91bootstrap-linux/

-- 
Bye, Peter Korsgaard
