From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 21:23:35 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for php
In-Reply-To: <20210107193355.BA97B82A8C@busybox.osuosl.org>
References: <20210107193355.BA97B82A8C@busybox.osuosl.org>
Message-ID: <20210107212335.76c7b085@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 Jan 2021 20:32:46 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 258a51a14c..b534a69c70 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -409,6 +409,7 @@ F:	package/perl-timedate/
>  F:	package/perl-uri/
>  F:	package/perl-www-robotrules/
>  F:	package/pixman/
> +F:	package/php/

"php" should be before "pixman" I believe, and it seems Python agrees:

$ python -c 'print("php" < "pixman")'
True

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
