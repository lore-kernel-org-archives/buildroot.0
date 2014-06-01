From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 15:51:25 +0200
Subject: [Buildroot] [PATCH 0/11 v5] Some download-related changes
 (branch yem/check-downloads)
In-Reply-To: <20140601154145.6fa6e4ee@free-electrons.com>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
 <20140601152441.045ec06b@free-electrons.com>
 <20140601133822.GG3430@free.fr>
 <20140601154145.6fa6e4ee@free-electrons.com>
Message-ID: <20140601135125.GI3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 15:41 +0200, Thomas Petazzoni spake thusly:
> On Sun, 1 Jun 2014 15:38:22 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > So, we must create temp files and temp clones with unique names. I'll
> > use mktemp for that.
> 
> Ah, yes, indeed, makes sense. It will work even if $(O) and $(DL_DIR)
> are in separate file systems *and* provide the atomicity guarantees
> that we need to use the same $(DL_DIR) for several parallel builds.
> 
> Looks good. I guess you'll respin the series with this change?

Yep.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
