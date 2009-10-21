From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 10:22:17 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
	plugins configurable
In-Reply-To: <1256066492-8158-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Tue\, 20 Oct 2009 21\:21\:32 +0200")
References: <200910200018.17071.markus.heidelberg@web.de>
	<1256066492-8158-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87vdi9qhqe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> gst-plugins-good gained a number of dependency-less plugins with
 Sven> the last update. This commit makes them configurable in buildroot.

 Sven>  GST_PLUGINS_GOOD_CONF_OPT = \
 Sven>  		$(DISABLE_NLS) \
 Sven> +		--disable-debug \
 Sven>  		--disable-examples \
 Sven> -		--disable-directdraw \

Why?

-- 
Bye, Peter Korsgaard
