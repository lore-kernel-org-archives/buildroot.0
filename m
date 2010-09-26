From: Martin Banky <Martin.Banky@gmail.com>
Date: Sun, 26 Sep 2010 14:22:49 -0700
Subject: [Buildroot] [PATCH 05/18] boa: convert to autotargets
In-Reply-To: <87sk0w46v4.fsf@macbook.be.48ers.dk>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
	<1285485249-29212-5-git-send-email-Martin.Banky@gmail.com>
	<87sk0w46v4.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimBPViR_b9ZdSG7Q_WTCiGt2DarLcmcsWfyUB6J@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
     Sorry, I missed that when I was putting the patch set together. I meant
to merge the two, when I was cherry picking them into a new branch. It was
the end of my night when I put this together. One question, does the
stripping happen automatically for gentargets? I was under the impression
that you had to specify it. I'm still trying to get a grasp on all the
different things that happen behind the scenes.

Martin

On Sun, Sep 26, 2010 at 12:55 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:
>
>  Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
>  Martin> ---
>  Martin>  package/boa/boa.mk |   38 +++-----------------------------------
>
> Ahh, missed this one - Would probably have made more sense if you had
> merged it with the gentargets one.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100926/f4af7583/attachment.html>
