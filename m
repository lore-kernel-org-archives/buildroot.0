From: Jeff Bailey <jeffbailey@google.com>
Date: Thu, 10 Jul 2014 19:21:39 +0000
Subject: [Buildroot] fakeroot patch
References: <CAMai9+qVrXKNEoC-7=aR+s09ytt-MEQaXQiAEpsE_g1voWHA3A@mail.gmail.com>
 <877g3lni3o.fsf@dell.be.48ers.dk>
Message-ID: <CAMai9+osi=SQp74yhL3qfdsJWawVzZy517aZdw6V67q9sytEOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct.  While most of our builds happen on x86 targeting ppc64le, when
doing development I use the ppc64le system natively to speed up build/test
iterations.

Tks,
Jeff Bailey

On Thu Jul 10 2014 at 12:12:31 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Jeff" == Jeff Bailey <jeffbailey@google.com> writes:
>
>  > Hi!  Your patch at http://git.buildroot.net/buildroot/commit/?id=
>  > f18c33b4cc9c344c6ac8e28bfac5ae42befc8b1c is confusing.
>
>  > Why did you drop the fakeroot patch?  I do use powerpc64le to build.
>
> So your build machine (the one you run Buildroot on, not the one you are
> cross compiling for) is a powerpc64le machine?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/ee54b97a/attachment.html>
