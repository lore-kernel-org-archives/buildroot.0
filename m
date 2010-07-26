From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 26 Jul 2010 17:10:08 +0200
Subject: [Buildroot] [PATCH 1/1] Deprecate the Alpha, IA64,
	Sparc and	Sparc64 support
In-Reply-To: <59f8b962e83de5bd5e13a6eb58530634e5701f0f.1280155876.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280155876.git.thomas.petazzoni@free-electrons.com>
	<59f8b962e83de5bd5e13a6eb58530634e5701f0f.1280155876.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100726151008.GA10692@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  config BR2_sparc
> +	# Sparc isn't really used in embedded systems, and in the
> +	# cases where it is used, Linux doesn't seem to be common, and
> +	# as of today we don't have a maintainer in Buildroot who
> +	# wants to take care of the sparc support.
> +	depends on BR2_DEPRECATED
>  	bool "sparc"

I received a SPARC based evaluation board recently:

http://www.gaisler.com/cms/index.php?option=com_content&task=view&id=339&Itemid=

Today their Linux support is based on snapgear.
I looked at more up-to-date alternatives and actually decided
to go with buildroot (I only considered OpenEmbedded and buildroot).

But I have made no progress so far (some kconfig stuff to do first).

Could we hold on with the removal of sparc for the rest of the year?
I will see if I can get something running.

	Sam
