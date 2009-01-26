From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 16:40:34 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	multimedia/alsa-lib python
In-Reply-To: <87skni2wrd.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Sat\, 17 Jan 2009 08\:54\:14 +0100")
References: <20090117001907.6679477587@busybox.osuosl.org>
	<87skni2wrd.fsf@macbook.be.48ers.dk>
Message-ID: <87vds26pot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 ulf> http://www.alsa-project.org/
 ulf> +
 ulf> +config BR2_PACKAGE_ALSA_LIB_PYTHON
 ulf> +	bool "Python support for alsa-lib"
 ulf> +	depends on BR2_PACKAGE_ALSA_LIB
 ulf> +	select BR2_PACKAGE_PYTHON

 Peter> It would probably be goodt to add a 'default BR2_PACKAGE_PYTHON' line,
 Peter> so it defaults to enabled if you have python support, and false
 Peter> otherwise.

 Peter> Alternatively it should depend on BR2_PACKAGE_PYTHON and just be
 Peter> default y, as it's probably pretty unlikely someone wants python
 Peter> support in alsa without having python enabled in the first place.

 Peter> The 2nd option seems cleanest to me, what do you think?

Ping?

-- 
Bye, Peter Korsgaard
