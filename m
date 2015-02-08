From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Feb 2015 11:48:38 +0100
Subject: [Buildroot] [PATCH 2/2] automake: use whenever possible the
	ACLOCAL_DIR variable
In-Reply-To: <87twz3gbn0.fsf@dell.be.48ers.dk>
References: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
 <1422809500-23948-2-git-send-email-fabio.porcedda@gmail.com>
 <87twz3gbn0.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC-B=zAzABoWX2sYjFnnX4nW+-8sGyjZFG+bmKnDPZMz3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 3, 2015 at 12:02 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
>  > Use the ACLOCAL_DIR in the GTK_DOC_M4_INSTALL hook.
>  > Move the ACLOCAL_DIR definition at the beginning so the definition is
>  > ahead the utilization.
>
>  > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Committed, thanks.

I've sent an updated version of this patch:
http://patchwork.ozlabs.org/patch/437690/

BR
-- 
Fabio Porcedda
