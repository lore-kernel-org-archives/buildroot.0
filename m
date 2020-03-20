From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:20:15 +0100
Subject: [Buildroot] [PATCH v2 2/2] fs/erofs: add support for creating
 EROFS rootfs image
In-Reply-To: <20200320071302.GB1975@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200316015838.15183-1-hsiangkao@aol.com>
 <20200316015838.15183-2-hsiangkao@aol.com>
 <20200319174942.GF10025@scaer>
 <20200320071302.GB1975@hsiangkao-HP-ZHAN-66-Pro-G1>
Message-ID: <20200320202015.GM10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gao, All,

On 2020-03-20 15:13 +0800, Gao Xiang spake thusly:
> On Thu, Mar 19, 2020 at 06:49:42PM +0100, Yann E. MORIN wrote:
[--SNIP--]
> > I know the other filesystems (squashfs, jffs2...) have a choice about
> > the compression method, but for those ther are two or more such
> > possibilities, so it makes sense they have a choice. For erofs, not so
> > much.
> > As such, I have dropped the choice altogether, and just kept the single
> > boolean to enable compression.
> Currently, I'm fine with that as well. After LZMA algorithm is ready
> upstream, I could submit another patch then.

Yes, the choice can then be reinstated, and that would even not break
existing configurations.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
