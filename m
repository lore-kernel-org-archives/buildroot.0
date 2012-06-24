From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jun 2012 10:12:53 +0200
Subject: [Buildroot] [PATCH resend3] source-check: change behavior to
 check only selected packages / add source-check-all
In-Reply-To: <878vfdbtot.fsf@macbook.be.48ers.dk>
References: <fef39461f25270f81f06.1340343522@beantl019720>
 <878vfdbtot.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LX4O2Knkvt1UamUeHp++5nB4kEJRJZ8pi7TBjxoqyDfyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 23 jun. 2012 23:32 schreef "Peter Korsgaard" <jacmet@sunsite.dk> het
volgende:
>
> >>>>> "Thomas" == Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> writes:
>
>  Thomas> The original 'source-check' target first selects all packages,
>  Thomas> and then checks whether the package tarballs can be found. This
>  Thomas> is useful for Buildroot maintainers, but less useful for
>  Thomas> developers working on a specific project. The latter only care
>  Thomas> about the packages used in that project.
>
>  Thomas> This patch removes the allyesconfig dependency to source-check
>  Thomas> so that only selected packages are checked. The original
>  Thomas> behavior is moved to a new target 'source-check-all'.
>
> Committed, thanks - But as we don't have the 'select-all-packages'
> functionality for 'make source' which is the parallel of 'make
> source-check', I decided to just get rid of source-check-all
> completely.
>
> People can always do make allyesconfig; make source-check if they want
> the old behaviour.

Ok, no problem, thanks.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120624/d5bd2f16/attachment.html>
