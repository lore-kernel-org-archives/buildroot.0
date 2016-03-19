From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 00:34:54 +0100
Subject: [Buildroot] [PATCH 11/16 v5] core/legal-info: renumber saved
 patches
In-Reply-To: <20160319160546.647dd3e4@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <239b97de0688ee582fee97a67f9534cd8ad29493.1457718289.git.yann.morin.1998@free.fr>
 <20160319160546.647dd3e4@free-electrons.com>
Message-ID: <20160319233454.GJ3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 16:05 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:24 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > Note: an alternative solution was suggested by Luca (and Arnout?), which
> > would be to check that no two patches have the same basename or bail-out
> > otherwise. I choose to keep the renumbering, because it follows the path
> > of least resistance (i.e. it does not break existing setups).
> 
> I second the position of Luca and Arnout. This renumbering is
> complicated and leads to ugly patch names that no longer match the
> original file name. So please simply bail-out if two patches have the
> same name. It's highly unlikely, so I don't think we should renumber
> all the patches and have different file names just to avoid this
> unlikely case.

Done.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
