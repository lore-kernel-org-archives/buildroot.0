From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 28 Jul 2015 11:41:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-27
In-Reply-To: <20150728105715.22962d48@free-electrons.com>
References: <20150728063018.ECCE8101BC0@stock.ovh.net>
 <20150728105715.22962d48@free-electrons.com>
Message-ID: <CA+BsyQ5Z82vX45Bf95_DyCzJzEHJ7LE639qYMx0SOWQ-6GHM_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> >       x86_64 |                   acpid-2.0.22 | NOK |
> http://autobuild.buildroot.net/results/7e60af535dd4177afdc4cb7b92e9abf27c3fba07/
> >       x86_64 |                   acpid-2.0.22 | NOK |
> http://autobuild.buildroot.net/results/90ca6a8d6947a320996376a453dfb1aa34b543ac/
>
> musl build problems. Brendan, you worked on this issue, do you have an
> update from upstream? Can you submit a patch to fix this?
>

Yup. Raised it with the maintainer, so I will submit a buildroot patch and
mark upstream-status as submitted.

>          arm |                    bdwgc-7.4.2 | NOK |
> http://autobuild.buildroot.net/results/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/
>
> Musl build issue. Any taker?
>

I'll add this one to my list if there are no other takers.

 >          arm |              ctorrent-dnh3.3.2 | NOK |
http://autobuild.buildroot.net/results/2c9ef771d146ce5b9df82735fdeb62926c84bd9f/

>
> compat.c: In function 'strnstr':
> compat.c:70:3: error: unknown type name 'ssize_t'
>    ssize_t plen;
>    ^
> compat.c:71:3: error: unknown type name 'ssize_t'
>    ssize_t len = strlen(needle);
>
> Smells like an easy to fix musl problem. Any taker ?
>

I'll try this one too.

>        sparc |                libglib2-2.44.1 | NOK |
> http://autobuild.buildroot.net/results/b3cb6515496cf09d305a1077d01f87d75ece8a8d/
> >        sparc |                libglib2-2.44.1 | NOK |
> http://autobuild.buildroot.net/results/9db61963bdcf8bdd6784e00af4945292cd2d816e/
>
> Atomic problem on SPARC. Brendan, you started working on this, and I
> think you found a solution. Can you send a patch?
>

Yup - again patch went upstream, no comment back; but again, I will submit
a buildroot patch and mark upstream-status submitted.

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150728/afd6ccb2/attachment.html>
