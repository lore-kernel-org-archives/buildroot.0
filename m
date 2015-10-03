From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 20:57:31 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
	enable/disable ipv6 support
In-Reply-To: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
 (Andreas Wetzel's message of "Wed, 23 Sep 2015 15:16:34 +0200")
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <87y4fj231g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Wetzel <andreas.wetzel@nanotronic.ch> writes:

 > Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
 > adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.

So apparently this is a bug in libwebsockets? Have you brought up the
issue with the libwebsockets developers?

-- 
Bye, Peter Korsgaard
