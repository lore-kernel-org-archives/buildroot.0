From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 12 Feb 2013 09:12:46 +0100
Subject: [Buildroot] kernel drivers
In-Reply-To: <1360613608.96975.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1360613608.96975.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <5119F97E.2040405@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.02.2013 21:13, schrieb Zoran Djordjevic:
> My question is mostly theoretical, so I will be much obliged if I'll be pointed at some links, although
> (as Buildroot user) I am interested in the way I can do things with Buildroot. What I would like to 
> know is how can I incorporate some new kernel driver (having it's source) into kernel build? First, where 
> should I put it in kernel source tree, then can I compile it independently, without rebuilding whole kernel 
> (I imagine modules can do the job)?
Hello Zoran,

there are some topics not already mentioned by Dimitros' and Grant's
replies:

* If you put your driver into the kernel tree it has to be GPL
* Nowadays editing the kernel outside of buildroot and building it with
buildroot is easy thanks to the source override feature
* There are some samples of "out-of-kerneltree" drivers in buildroot
that can be used as a guideline for this, e.g. package/owl-linux/

Reards

Stephan
> How can I compile it as a module or to be more precise, do I write driver in some special way to be a module? 
> (I see that Buildroot offers some driver to be choosed for module compiling or to be part of monolitic kernel).
>  
> Regards
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130212/fb0e7ea2/attachment.html>
