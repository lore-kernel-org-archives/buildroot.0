From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 21 Oct 2009 19:14:50 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
 plugins configurable
In-Reply-To: <87my3lq960.fsf@macbook.be.48ers.dk>
References: <200910200018.17071.markus.heidelberg@web.de>
	<1256066492-8158-1-git-send-email-s.neumann@raumfeld.com>
	<87vdi9qhqe.fsf@macbook.be.48ers.dk> <1256115940.11240.5.camel@sven>
	<87my3lq960.fsf@macbook.be.48ers.dk>
Message-ID: <1256145290.19499.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2009-10-21 at 13:27 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> GST_PLUGINS_GOOD_CONF_OPT = \
>  Sven> $(DISABLE_NLS) \
>  Sven> +		--disable-debug \
>  Sven> --disable-examples \
>  Sven> -		--disable-directdraw \
> 
>  Sven> Hmm, perhaps directdraw should become an option as well, but I thought
>  Sven> it's not really interesting for the buildroot target audience.
> 
> Is that directdraw as in the component of Microsoft DirectX? That indeed
> doesn't seem like something we would want to enable. Why did you remove
> the line?

Ah right, now I rememeber. It is not any longer a valid configure option
for the new release. So I removed it.


Sven
