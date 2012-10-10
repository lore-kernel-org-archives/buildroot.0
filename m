From: ludovic.desroches <ludovic.desroches@atmel.com>
Date: Wed, 10 Oct 2012 16:33:35 +0200
Subject: [Buildroot] [PATCH v2] fb-test-app: new package
In-Reply-To: <87txu28pfe.fsf@macbook.be.48ers.dk>
References: <1349798007-22053-1-git-send-email-ludovic.desroches@atmel.com>
 <87txu28pfe.fsf@macbook.be.48ers.dk>
Message-ID: <5075873F.2070504@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/10/2012 02:47 PM, Peter Korsgaard a ?crit :
>>>>>>    <ludovic.desroches@atmel.com> writes:
>
>   > From: Ludovic Desroches <ludovic.desroches@atmel.com>
>   > Test suite for Linux framebuffer.
>   > +
>   > +define FB_TEST_APP_BUILD_CMDS
>   > +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>
> We should also pass our CFLAGS and LDFLAGS. I've added a patch to let
> the fb-test-app build system support this and then used
> TARGET_CONFIGURE_OPTS instead.

Ok, thanks Peter for this improvement.

>
> Committed with that change, thanks.
>
