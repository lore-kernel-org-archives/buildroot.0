From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 21 Sep 2009 21:40:37 +0200
Subject: [Buildroot] [PATCH] samba: fix dependencies
In-Reply-To: <87bpl4umnl.fsf@macbook.be.48ers.dk>
References: <1253550113-31475-1-git-send-email-s.neumann@raumfeld.com>
	<87bpl4umnl.fsf@macbook.be.48ers.dk>
Message-ID: <1253562037.29667.13.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2009-09-21 at 21:23 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> The samba configure scripts detects the presence of fam and avahi
>  Sven> headers in order to decide whether support for fam and/or avahi should
>  Sven> be built into samba. This patch adds the missing dependencies so that
>  Sven> fam and/or avahi are built before samba if they are selected in buildroot.
> 
> Thanks, but it doesn't apply (which is slightly odd as your patches are
> the only thing changing samba.mk in 2009). Could you recreate against
> git please?

Well, there is still the patch attached to bug #301 and I have that
applied in our branch. I will merge the patch to the master branch and
resend it...


Sven
