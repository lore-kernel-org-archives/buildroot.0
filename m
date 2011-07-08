From: James Hanley <jhanley@dgtlrift.com>
Date: Fri, 8 Jul 2011 12:36:55 -0400
Subject: [Buildroot] Feature request - pull sources from repose
In-Reply-To: <87wrfuqa4e.fsf@macbook.be.48ers.dk>
References: <5725744097739393062@unknownmsgid>
 <87wrfuqa4e.fsf@macbook.be.48ers.dk>
Message-ID: <CAF++6AOsD-5==iwidP2xfQJiDiFcBzqM6FgkdD4p5THY-R1C3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I meant to reply all - sorry Peter for the double message.

I used this patch
http://lists.uclibc.org/pipermail/uclibc-cvs/2011-June/029684.html
with some modification - specifically where he used
int nsig = _NSIG / 8;
I used
const int nsig = _NSIG / 8;



On Thu, Jul 7, 2011 at 1:22 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "James" == James Hanley <jhanley@dgtlrift.com> writes:
>
> ?James> Right now, buildroot downloads sources from released tarball urls, it
> ?James> would be great if they could also pull from source repositories (git,
> ?James> svn, etc.) to get unreleased features. For example I ran into an issue
> ?James> with uclibc which was fixed but not yet released. ?It may also assist
> ?James> in weeding out integration issues before package release.
>
> I see Thomas already answered you, but what problem was this exactly and
> what uClibc git commit fixed it? Probably we can backport it to 0.9.32
> and include it in buildroot.
>
> --
> Bye, Peter Korsgaard
>
