From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun, 8 Sep 2019 10:16:20 -0700
Subject: [Buildroot] patch series was: [PATCH 10/27] package/monit: bump to
 version 5.26.0
In-Reply-To: <20190908184047.3ca7f0b8@windsurf>
References: <20190908161125.26313-1-chrismcc@gmail.com>
 <20190908184047.3ca7f0b8@windsurf>
Message-ID: <CALURroRBQj+Ym_WnZ2A10nY87qFPEnH-C-hZXJwaxY8OD3WLQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 8, 2019 at 9:40 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sun,  8 Sep 2019 09:11:25 -0700
> Christopher McCrory <chrismcc@gmail.com> wrote:
>
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> > ---
> >  package/monit/monit.hash | 4 ++--
> >  package/monit/monit.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
>
> We already bumped monit to 5.26.0 in master, I think I applied the
> patch yesterday.
>
>
I did most of these over the last couple days and double checked them this
morning. My git foo is not strong. I didn't want to lose all that work with
a bungled git pull.

I tested these with a local gcc 8 build and
autobuild/br-x86-64-core2-full.config toolchains. Followed by a make
legal-info and fixed some hash entries.

I also have updates for six more packages that I will send tomorrow. These
next ones all have patches removed or changed and might need a little more
looking at with other eyes.

Hope this helps




> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190908/bfab6c20/attachment.html>
