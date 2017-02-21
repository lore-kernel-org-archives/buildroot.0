From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Feb 2017 21:54:35 +0100
Subject: [Buildroot] [PATCH 1/2 next] Revert "reproducible: fix
 DATE/TIME macros in toolchain-wrapper"
In-Reply-To: <20170221214750.4c057f08@free-electrons.com>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
 <20170221214750.4c057f08@free-electrons.com>
Message-ID: <20170221205435.GA3347@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-21 21:47 +0100, Thomas Petazzoni spake thusly:
> On Tue, 21 Feb 2017 21:32:35 +0100, Yann E. MORIN wrote:
> > This reverts commit 76838f63412a30a358210e457dda4b79f7730624.
[--SNIP--]
> This has already been applied in master:
>   https://git.buildroot.org/buildroot/commit/?id=1c8c0d91a431fda2c052072af87e0de35bd3b953
I know.

And as the cover letter stated (and as the 'tag' in the subject tells),
this is intended for next. ;-)

It is needed to revert this patch in next before applying the following
patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
