From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 13:27:19 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
	plugins configurable
In-Reply-To: <1256115940.11240.5.camel@sven> (Sven Neumann's message of "Wed\,
	21 Oct 2009 11\:05\:40 +0200")
References: <200910200018.17071.markus.heidelberg@web.de>
	<1256066492-8158-1-git-send-email-s.neumann@raumfeld.com>
	<87vdi9qhqe.fsf@macbook.be.48ers.dk> <1256115940.11240.5.camel@sven>
Message-ID: <87my3lq960.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> GST_PLUGINS_GOOD_CONF_OPT = \
 Sven> $(DISABLE_NLS) \
 Sven> +		--disable-debug \
 Sven> --disable-examples \
 Sven> -		--disable-directdraw \

 Sven> Hmm, perhaps directdraw should become an option as well, but I thought
 Sven> it's not really interesting for the buildroot target audience.

Is that directdraw as in the component of Microsoft DirectX? That indeed
doesn't seem like something we would want to enable. Why did you remove
the line?

 Sven> --disable-debug should perhaps be configurable or depend on
 Sven> BR2_ENABLE_DEBUG ?

That might be an idea, yes.

-- 
Bye, Peter Korsgaard
