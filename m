From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed,  7 Jul 2010 17:51:40 +0200
Subject: [Buildroot] Getting package sources from git/svn/bzr
Message-ID: <L572Q4$920622E1B47231A042F2F429C560F2E5@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient Remainder wrote:
> Hello Luca,
>
> On Fri, 2010-07-02 at 12:58 +0200, Luca Ceresoli wrote:
> >
> > The difference between the two methods (clone vs archive) is not clear
> > to me. I got how each works, but what advantages do they have over each
> > other?
>
> Well, I'm thinking that most people will just get an archive because
> they just want to compile the code, but some will want to make edits and
> contribute their changes so they will need to do a clone. I suppose
> it's a first step in making buildroot into a system that can be used as
> a day-to-day development environment as well as a build system.

While git archive --remote is definitely a clever thing for buildroot,
I notice it does not work in many cases.

Github does not support git archive --remote
(http://support.github.com/discussions/feature-requests/145-deploying-without-cloning)

Gitosis does not work as well.

It seems like git.kernel.org and git.pengutronix.de do not as well. It might
be caused my the damn corporate firewall, but sniffing suggest it's not so.

Luca
