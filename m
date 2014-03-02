From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 02 Mar 2014 12:29:50 +0100
Subject: [Buildroot] [PATCH 9/9] exim: add new package
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
 <1314127033-14861-10-git-send-email-luca@lucaceresoli.net>
Message-ID: <eahbuaxc1k.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli <luca@lucaceresoli.net> wrote in
news:1314127033-14861-10-git-send-email-luca at lucaceresoli.net: 

> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> new file mode 100644
> index 0000000..a12f5a2
> --- /dev/null
> +++ b/package/exim/exim.mk
> @@ -0,0 +1,49 @@
> +#############################################################
> +#
> +# exim
> +#
> +#############################################################
> +
> +EXIM_VERSION = 4.76

Hi,

quoting a mail from Aug 23rd, 2011 ;)

Is there still interest in having Exim in buildroot?

I have package files for my personal needs which deliver Exim 4.80.1 (, based 
on the quoted package, update to 4.82 is pending), Dovecot 2.2.12, dovecot-
pigeonhole 0.4.2, fetchmail 6.3.26 and clamav 0.98.1 which are used on a 
production system using uClibc/i386 for several months now.

Regards, Bernd
