From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Dec 2009 00:39:58 +0100
Subject: [Buildroot] [PATCH 5/6] Added libdvdnav package (dependency of
	gst-plugins-bad)
In-Reply-To: <87ein2v1ta.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Fri, 11 Dec 2009 00:36:49 +0100")
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
	<1258065198-22972-6-git-send-email-llandwerlin@gmail.com>
	<87ein2v1ta.fsf@macbook.be.48ers.dk>
Message-ID: <878wdav1o1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:
 llandwerlin> +++ b/package/multimedia/libdvdnav/Config.in
 llandwerlin> @@ -0,0 +1,7 @@
 llandwerlin> +config BR2_PACKAGE_LIBDVDNAV
 llandwerlin> +	bool "libdvdnav"
 llandwerlin> +        select BR2_PACKAGE_LIBDVDREAD
 llandwerlin> +	help
 llandwerlin> +	  libdvdnav is a library that allows easy use of sophisticated
 llandwerlin> +	  DVD navigation features such as DVD menus, multiangle
 llandwerlin> +	  playback and even interactive DVD games.

 Peter> Same issues as with cdaudio, but I've fixed that myself - Committed,
 Peter> thanks.

Ups, that comment was for libdvdread (but applies here as well).

-- 
Bye, Peter Korsgaard
