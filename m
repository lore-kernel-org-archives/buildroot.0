From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 14:24:49 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package: pcre
In-Reply-To: <87ve272kgg.fsf@macbook.be.48ers.dk>
References: <20080424165606.555523C7F7@busybox.net>
	<87ve272kgg.fsf@macbook.be.48ers.dk>
Message-ID: <46a136670804241124g2e909d94pa3c73a501536c82@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one was created by Arnar Mar Sigurdsson. He'll have to answer that
question, I don't use it myself.

John


On Thu, Apr 24, 2008 at 2:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "ninevoltz" == ninevoltz  <ninevoltz@uclibc.org> writes:
>
>  ninevoltz> Author: ninevoltz
>  ninevoltz> Date: 2008-04-24 09:56:06 -0700 (Thu, 24 Apr 2008)
>  ninevoltz> New Revision: 21848
>
>  ninevoltz> Log:
>  ninevoltz> add pcre
>
>  ninevoltz> +#############################################################
>  ninevoltz> +#
>  ninevoltz> +# PCRE
>  ninevoltz> +#
>  ninevoltz> +#############################################################
>  ninevoltz> +PCRE_VERSION = 7.6
>  ninevoltz> +PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
>  ninevoltz> +PCRE_SITE =
> ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
>  ninevoltz> +PCRE_INSTALL_STAGING = YES
>  ninevoltz> +PCRE_INSTALL_TARGET = YES
>  ninevoltz> +
>  ninevoltz> +PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME)
> --host=$(GNU_TARGET_NAME) \
>  ninevoltz> +        --build=$(GNU_HOST_NAME) --prefix=/usr \
>  ninevoltz> +        --includedir=/usr/include
>
> Is --includedir needed?
>
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/5886d89e/attachment.htm 
