From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 16:23:32 +0200
Subject: [Buildroot] [PATCH 04/20] package/skeleton: make
 SKELETON_LIB_SYMLINK a macro
In-Reply-To: <20170722155001.533d6aec@windsurf>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <bdf6c32405c104dedd4c7ad42f907a09c2f5ad21.1500398733.git.yann.morin.1998@free.fr>
 <20170722155001.533d6aec@windsurf>
Message-ID: <20170722142332.GC9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-22 15:50 +0200, Thomas Petazzoni spake thusly:
> On Tue, 18 Jul 2017 19:25:30 +0200, Yann E. MORIN wrote:
> > Rather than duplicate that code in all skeleton packages, make this a
> > macro, so that it is easier to use.
> 
> Is it really going to be used in *all* skeleton packages ? Because if
> it is, it means it's the exact same call that will be duplicated
> everywhere, which would mean it should be factored out.
> 
> But in practice, it seems it's not used in all skeleton packages, but
> just in skeleton-common.mk and skeleton-custom.mk, correct ?

Right.

Cordialement,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
