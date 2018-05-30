From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 May 2018 17:36:18 +0200
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
In-Reply-To: <5b0ccc753f59_1c272ab87ea319a052883@ultri5.mail>
References: <20180528194429.GF2965@scaer>
 <5b0ccc753f59_1c272ab87ea319a052883@ultri5.mail>
Message-ID: <20180530153618.GB2592@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-05-29 00:43 -0300, Ricardo Martincoski spake thusly:
> On Mon, May 28, 2018 at 04:44 PM, Yann E. MORIN wrote:
> > Why do we even use pip to install those? Can't we just rely on the
> > verions actually packaged in the distro instead? I.e.
[--SNIP--]
> >> Are you preparing a patch?
> > When we agree on the directions, yes I can.
> 
> Reproducible images with less code and less maintenance effort in exchange of
> using a not-so-bleeding-edge version. Makes sense to me.

OK, so I'll send a patch to implement this soilution.

Thanks! :-)

> I am only in doubt how future-proof is this solution, if some day we will
> *need* a new version, i.e. to something related to Python3 in 2020 (it's only a
> wild guess!, I don't know any current limitation, I don't know the internals of
> flake8).
> But then probably debian will have a newer version of flake8, so we can update
> the stretch version. And we can always go back to using pip if really needed.

Yes, then we can update to a newer version of the distro.

There was also a wild suggestion that we provide more Docker images,
for each of the mainstream distros.

Because sometimes, build issues only occur on some distros and not
others, e.g. arch-linux, which uses musl, sometimes break the build of
some host packages, and it is difficult to diagnose and fix...

I was also looking into providing additional Dockerfiles for additional
distros. I'll get this in the same series. Soon. Sooooon.... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
