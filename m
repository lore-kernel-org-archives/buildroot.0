From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:59:58 +0200
Subject: [Buildroot] [PATCH 06/17] perl-module-runtime: add host
In-Reply-To: <20180812141336.0621e01e@windsurf>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-7-chrismcc@gmail.com>
 <CAB0FRssyWKMjxCeX9WHg7K-P5A97W32X4Qr=S8EvMOTBovn5LA@mail.gmail.com>
 <20180812141336.0621e01e@windsurf>
Message-ID: <20180813235958.4999fe33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sun, 12 Aug 2018 14:13:36 +0200, Thomas Petazzoni wrote:

> (Thanks for reviewing the Perl patches, definitely very useful!)
> 
> On Sun, 12 Aug 2018 11:21:07 +0200, Fran?ois Perrad wrote:
> > Most of the time, host-perl-* packages are useless on BuildRoot,
> > please, double check the package which introduces this dependency.  
> 
> For which specific patches are you giving this comment ? Does it also
> apply to host-perl-cgi, host-perl-html-parser and
> host-perl-html-tagset ?

Could you comment on this specific perl-module-runtime patch, adding
the host variant ? Christopher, have you been able to verify if it it's
really needed for your use-case ?

Fran?ois, I also need your input/review on:

  http://patchwork.ozlabs.org/patch/956316/
  http://patchwork.ozlabs.org/patch/956590/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
