From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Mon, 9 Jul 2007 12:01:08 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
In-Reply-To: <20070709094027.GB20627@aon.at>
References: <20070709045947.D862330066@busybox.net>
	<0707091002300.8319@somehost>
	<20070709091324.GB19774@aon.at> <0707091121270.8319@somehost>
	<20070709094027.GB20627@aon.at>
Message-ID: <0707091152450.8319@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 9 Jul 2007, Bernhard Fischer wrote:

> $ svn log -r18769
> ------------------------------------------------------------------------
> r18769 | aldot | 2007-06-07 14:57:03 +0200 (Thu, 07 Jun 2007) | 5 lines
>
> - provide a "source-check" target that tries to download all packages with
>   wget's spider-mode (i.e. just see if the server says the file is there without
>   actually downloading the files.
>   Convenient to check for unavailable source-packages.
>
> ------------------------------------------------------------------------
>
> This is ment for developers who want to check for unavailable packages.
> If you're uncomfortable with it, Don't Do That Then. And no, i don't
> bother to save the config away. That's your duty (you most likely also
> don't want to set all and every config option to yes for a real rootfs).

Thanks for opening my eyes :)

But, wouldn't you agree that doing the same thing witout changing the
.config could be a much more elegant way to do it?


-- 
Cristian
