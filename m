From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Apr 2019 23:30:12 +0200
Subject: [Buildroot] [PATCH 0/2] [AUTOBUILD] Store package files list in
 results (branch yem/files-list)
In-Reply-To: <20190403231356.77a41b10@windsurf>
References: <cover.1554054435.git.yann.morin.1998@free.fr>
 <20190403231356.77a41b10@windsurf>
Message-ID: <20190403213012.GC2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-03 23:13 +0200, Thomas Petazzoni spake thusly:
> On Sun, 31 Mar 2019 19:48:20 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Yann E. MORIN (2):
> >       [AUTOBUILD] autobuild-run: add helper function to copy-if-exists
> >       [AUTOBUILD] autobuild-run: also copy packages files lists if they exist
> 
> Both applied. I hope those additional files will not be too big: we
> keep all those files for all build results, so it can add up quite a
> bit over time. The build results currently take 64 GB of disk space,
> and require 1303600 files.

I would expect those files to be of about the same size as the build.log
snippet we keep.

If it turns out to be a problem, then we can restrict that to only failed
builds.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
