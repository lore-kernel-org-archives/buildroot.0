From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 24 Apr 2008 20:06:02 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package: pcre
In-Reply-To: <87ve272kgg.fsf@macbook.be.48ers.dk>
References: <20080424165606.555523C7F7@busybox.net>
	<87ve272kgg.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730804241606h52615abdx4017182bf00907a2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>   ninevoltz> +PCRE_VERSION = 7.6
>   ninevoltz> +PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
>   ninevoltz> +PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
>   ninevoltz> +PCRE_INSTALL_STAGING = YES
>   ninevoltz> +PCRE_INSTALL_TARGET = YES
>   ninevoltz> +
>   ninevoltz> +PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
>   ninevoltz> +        --build=$(GNU_HOST_NAME) --prefix=/usr \
>   ninevoltz> +        --includedir=/usr/include
>
>  Is --includedir needed?
>

It just doesn't seam right. If it's needed, then it's using the host includes.
