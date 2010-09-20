From: Martin Banky <Martin.Banky@gmail.com>
Date: Sun, 19 Sep 2010 17:37:01 -0700
Subject: [Buildroot] [PATCH 21/21] BugFix - m4 - Fixed Missing wint_t
 typedef When There Is No WChar Support
In-Reply-To: <87aand4g4b.fsf@macbook.be.48ers.dk>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-21-git-send-email-Martin.Banky@gmail.com>
	<87aand4g4b.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikzNG+2t9KgpkXXQJDpdRsbh6wq81UANg3CvAbL@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
     Not a problem, I just thought I would share my fixes for the type of
system that I'm building. I'm trying to build a target compiler system,
because I have some very complicated builds that I have to do. I have a very
tweaked build of Qt that is hard enough to do in a native environment, let
alone in buildroot. I also have software that I'm developing(at last count
about 15 packages), that would be too much work to convert to buildroot. For
me, it is just easier to have a native compiler to do these things. Also, I
have not had a chance to test the latest version of m4, so maybe that will
fix things. I'll let you know, it's on my todo list.

Martin

On Sun, Sep 19, 2010 at 1:45 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:
>
>  Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
>
> Thanks, but I find this too hackish. M4 is not a package typically
> needed on really small systems, so just depending on WCHAR is cleaner
> imho.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100919/e7dcc064/attachment-0001.html>
