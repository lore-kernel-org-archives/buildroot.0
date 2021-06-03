From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jun 2021 21:54:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: fix installation of
 systemd units
In-Reply-To: <5ace21b3-7b64-8c5a-3cb5-0d26bdd251d0@mind.be>
References: <cover.1621608266.git.yann.morin.1998@free.fr>
 <7aca7804d91a74070a56be2b9d8781eb0fd82446.1621608266.git.yann.morin.1998@free.fr>
 <5ace21b3-7b64-8c5a-3cb5-0d26bdd251d0@mind.be>
Message-ID: <20210603195428.GG168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On 2021-06-02 23:12 +0200, Arnout Vandecappelle spake thusly:
> On 21/05/2021 16:44, Yann E. MORIN wrote:
> > Since we bump the version in commit 80997acd3587 (package/lvm2: bump
> > version to 2.03.12), the installation of systemd units is no longer
> > functional without a full installation.
> > 
> > As Pascal puts it: the systemd service files don't make a whole lot of
> > sense when there isn't a full lvm2 install.
> > 
> > Move the conditional block that install system units, so that it only
> > occurs when we do a full installation.
> > 
> > Fixes;
>  In the future, please use a colon so patchwork picks it up as a fix :-)

Oh come on... It would mean I would have to hit the 'shift' key right
before I hit the ';' key, not right after. This is too difficult for me
to synchronise those two key hits right...

(If I had used an azerty keyboard, not an qwerty one, my excuse would
have been that the ';' and ':' keys are too close to each other, and
aiming for the correct key would too difficult for my fat fingers...)

> >     http://autobuild.buildroot.org/results/f47/f470ffb55625e2639cecde713442550eb532d0d7/
> >     http://autobuild.buildroot.org/results/954/9547929292e81671fbe3a5b4bbc87a6424edb1ca/
> >     http://autobuild.buildroot.org/results/303/30359c351a6ce2f9139494a531e036f0b0406ccf
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Co-Developped-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> > Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
> > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Series applied to master, thanks.

As I understood, that's been applied ot both next and master. Thanks!
:-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
