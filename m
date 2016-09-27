From: Martin Bark <martin@barkynet.com>
Date: Tue, 27 Sep 2016 09:22:02 +0100
Subject: [Buildroot] Buildroot nodejs 6.6.0
In-Reply-To: <87zimu30ny.fsf@dell.be.48ers.dk>
References: <6C0FD5AC-BA66-48C8-BC00-3F8393524B7B@bluecordial.com>
 <CAFGQKxf-pPGUuML2c6-0J4moQfJidxhRLcWOC8avA46gqHon7Q@mail.gmail.com>
 <87zimu30ny.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxcFTgyOWB+h84PgRCVpcpTRYe1q9XrJe3B+dVZAycu1oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 September 2016 at 20:45, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
>  > Paul,
>  > I've been busy on other work recently so I've not had the time to bump
> the
>  > node version in buildroot for a while.  I do have some patches lined up
> to
>  > bump node to 6.6.0, however, I've held off submitting them because
> 6.7.0 is
>  > due tomorrow (see
>  > https://nodejs.org/en/blog/vulnerability/september-2016-
> security-releases/).
>  > So i expect to submit some patches hopefully later this week to bump
> node
>  > to 6.7.0.
>
> Thanks. From that list I also see that security support for the 0.10.x
> series will end in October, so we should presumably remove 0.10.x
> support before the 2016.11 release.


The 0.10.x branch is only included for the armv5 since version > 0.10.x
dropped support.  In the past there was discussion around leavening 0.10.x
in buildroot even when support ended for it.  Personally i would like to
drop 0.10.x to help tidy up the nodejs package but I'm fine with leaving it
if people use it.

Note: I'll submit patches to bump 6.x to 6.7.0 and 0.10.x to 0.10.47

Thanks

Martin


>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160927/30a5fe67/attachment.html>
