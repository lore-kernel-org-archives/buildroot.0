From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 17:01:11 +0200
Subject: [Buildroot] [PATCH v8 0/5] package/python-scipy: new package
In-Reply-To: <CAMty3ZCQ8qmZY9f=Lqv71fMYX3ej1eDxvL00w42B9fxSsagmjA@mail.gmail.com>
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
 <20200407134946.7b333d99@windsurf.home>
 <CAMty3ZCQ8qmZY9f=Lqv71fMYX3ej1eDxvL00w42B9fxSsagmjA@mail.gmail.com>
Message-ID: <20200407150111.GP22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jagan, All,

On 2020-04-07 19:13 +0530, Jagan Teki spake thusly:
> On Tue, Apr 7, 2020 at 5:19 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Tue,  7 Apr 2020 16:45:10 +0530
> > Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > This is v8 changes for python-scipy, here is the previous
> > > version series[1].
> > Thanks for this new iteration. Could you have a look at the backlog of
> > patches at http://patchwork.ozlabs.org/project/buildroot/list/ and
> > update any patch that is no longer relevant due to this new iteration
> > to the state "Superseded" ? You can do that yourself for the patches
> > that you have sent (provided that you have a patchwork account matching
> > the e-mail used to send the patches). For the other patches, you can
> > simply let us know, and we'll update the patch status.
> >
> > This helps us keep a patchwork backlog that makes sense.
> 
> Yes, I've updated all my previous version changes. regarding pybind11,
> adam has this series [2]. I already incorporated test patch in my
> series as per his request.
> [2] http://patchwork.ozlabs.org/project/buildroot/list/?series=145831

So I've marked the seriers from Adam as superseded.

However, there was a review of his pybind11 patch: since it installs
only a header, it should be _INSTALL_TARGET = NO

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
