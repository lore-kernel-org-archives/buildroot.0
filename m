From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 14:10:37 +0200
Subject: [Buildroot] [PATCH 00/13] perl modules again
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820141037.5b4c40cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Note: the title of your cover letter says PATCH 00/13, but your series
has 18 patches. Seems like something went wrong.

On Mon, 20 Aug 2018 04:55:01 -0700, Christopher McCrory wrote:

> Christopher McCrory (18):
>   perl-dbi: add host package
>   perl-dbd-mysql: new package
>   perl-data-dump: new package
>   perl-time-parsedate: new package
>   perl-x10: new package
>   perl-sys-cpu: new package
>   perl-dist-checkconflicts: new package
>   perl-package-stash: new package
>   perl-class-load: new package
>   perl-template-toolkit: new package
>   perl-xml-parser: new package
>   perl-soap-wsdl: new package
>   perl-time-parsedate: add license
>   perl-termreadkey: new package
>   pkg-utils.mk: patch_sub_makefile
>   perl-template-toolkit: use new patch_sub_makefile
>   perl-xml-parser: use new patch_sub_makefile
>   perl-soap-wsdl: add dependancy on perl-termreadkey

Note: you still had a number of patches pending. Some of them are in
this new series some not, which is a bit unclear on which ones you
still want to get merged, which one you do want. I've marked all those
older patches as Superseded:

  http://patchwork.ozlabs.org/patch/956316/
  http://patchwork.ozlabs.org/patch/956592/
  http://patchwork.ozlabs.org/patch/956590/
  http://patchwork.ozlabs.org/patch/956598/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
