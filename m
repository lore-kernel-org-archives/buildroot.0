From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Dec 2014 14:31:56 +0100
Subject: [Buildroot] [PATCH 3/3 v2] toolchain: add hashes for all
 remaining external toolchains
In-Reply-To: <20141228135810.763ae357@free-electrons.com>
References: <cover.1419768498.git.yann.morin.1998@free.fr>
 <f924e745902fb357ec83221b28fb8a0f9a38a311.1419768498.git.yann.morin.1998@free.fr>
 <20141228135810.763ae357@free-electrons.com>
Message-ID: <20141228133156.GB4254@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-28 13:58 +0100, Thomas Petazzoni spake thusly:
> On Sun, 28 Dec 2014 13:19:31 +0100, Yann E. MORIN wrote:
> 
> > +# Buildroot (?)
> > +sha256 3e1c7c53fadfd3346ab60386c573f07f0617ab119546ec8cb93bc20c23cff2b3  lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
> > +sha256 b72f7be654a75bb643372f3909de7b8739f0f56bdf8bea98fea41dcecefe6b6b  microblazeel-unknown-linux-gnu.tgz
> > +sha256 ed2fea022f2def257ca6db09911b73c7102aaa1792d2da2d81371a763e5c2eff  lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
> > +sha256 53ee0b1ad50e651eb14d0b53044b90e7bf7e3cb341ee57fe575bc4c4e142ea37  microblaze-unknown-linux-gnu.tgz
> 
> These are not Buildroot toolchains. They are provided by Xilinx, but
> hosted on sources.buildroot.net since the official site was not working
> anymore, or something like that.

OK, I'll update the comment accordingly, unless whoever commits that
does it. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
