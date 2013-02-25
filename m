From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 24 Feb 2013 21:39:37 -0800
Subject: [Buildroot] [PATCH] gstreamer: ALSA plugin requires threads
	support
In-Reply-To: <87mwuubw8l.fsf@dell.be.48ers.dk>
References: <1361603043-22539-1-git-send-email-gilles.talis@gmail.com>
 <87mwuubw8l.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2xs8Cj0Qr0Gah6-k2t8mhKmD5eYKEF++uLBqj8u6zZ38w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/2/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:
>
>  Gilles> Fixes:
>  Gilles> http://autobuild.buildroot.org/results/2782b5ee6af25da9d49d9bc7b950dc2a92fb5bca
>
> Isn't all of gstreamer heavily threaded?

Yes, it is. But still it can be built with a toolchain that does not
provide threads support. Not sure if/how it works (could not test it
myself), but it builds. I just hit an issue in glib2 that I need to
look into a bit further.

Gilles.
