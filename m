From: Jeff Bailey <jeffbailey@google.com>
Date: Thu, 10 Jul 2014 19:37:20 +0000
Subject: [Buildroot] fakeroot patch
References: <CAMai9+qVrXKNEoC-7=aR+s09ytt-MEQaXQiAEpsE_g1voWHA3A@mail.gmail.com>
 <877g3lni3o.fsf@dell.be.48ers.dk>
 <CAMai9+osi=SQp74yhL3qfdsJWawVzZy517aZdw6V67q9sytEOw@mail.gmail.com>
 <8738e9nhb6.fsf@dell.be.48ers.dk>
Message-ID: <CAMai9+rmFJtFMsavVoMgQ7_M7C2ABYy9NSm=HreXOhhH6ihEhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Jul 10 2014 at 12:29:37 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Jeff" == Jeff Bailey <jeffbailey@google.com> writes:
>
>  > Correct.  While most of our builds happen on x86 targeting ppc64le,
> when doing
>  > development I use the ppc64le system natively to speed up build/test
>  > iterations.
>
> Ok, and you still use Buildroot for that? Buildroot is really a system for
> cross
> compilation. Do you do ppc64le->ppc64le cross compilation? How does that
> speed up development?
>

So today's case is that I have patches that apply to petitboot and friends.
 I've tested them out locally.  Now I need to make sure that the buildroot
setup hasn't rotted (I haven't looked since May).  At this point I'd build
it locally to make sure the configuration had all the right dependencies
and such and that the result was chrootable.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/48b045bc/attachment.html>
