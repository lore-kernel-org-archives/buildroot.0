From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Dec 2018 09:56:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-security: new
 package
In-Reply-To: <CADvTj4qArP_W_5qb=RyYTnhRe0iyLXhR=vcAajGSx+aHUaarLQ@mail.gmail.com>
References: <1544139188-28022-1-git-send-email-james.hilliard1@gmail.com>
 <CAGm1_ktEWoZq4HLuf2jZVoLFE3JmVwKVb=_QLoX7DpQ3-YYB-A@mail.gmail.com>
 <CADvTj4p0RkurDDaBQ5J2HFTshr6zZ7zMyHYC43R34BTSfqO_TA@mail.gmail.com>
 <20181207094619.0f4bf1cd@windsurf>
 <CADvTj4qArP_W_5qb=RyYTnhRe0iyLXhR=vcAajGSx+aHUaarLQ@mail.gmail.com>
Message-ID: <CAGm1_ktucxQPVnhH_YidiJ_GjA3baFQjV4jc+8+U3_=yg_hyPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Fri, Dec 7, 2018 at 9:48 AM James Hilliard <james.hilliard1@gmail.com> wrote:
>
> Ok, will try and do that in the future. I was keeping them in separate
> branches so that they are easier to amend.

With this series applied you'll have more than 10 Python packages
you're responsible for. I wonder whether it make sense to add

package/python*

for your DEVELOPERS record. Especially if you're going to add more
Python packages in the future.

Yegor

> On Fri, Dec 7, 2018 at 1:46 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello James,
> >
> > On Fri, 7 Dec 2018 01:16:34 -0700, James Hilliard wrote:
> > > These are all independent patches which shouldn't depend on each
> > > other, I have them all in separate branches.
> >
> > One issue is that since they touch packages with very close names, all
> > of those patches will conflict on the DEVELOPERS file and
> > package/Config.in files. I.e, if I apply your patch on
> > package/python-aiohttp-session and then apply your patch on
> > package/python-aiohttp-security, the latter will fail.
> >
> > Those conflicts are trivial, so we can resolve them when applying. But
> > it's nicer when there are no conflicts at all, and in this case,
> > posting as a series of patches, as suggested by Yegor, makes a lot of
> > sense.
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
