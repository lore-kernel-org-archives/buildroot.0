From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 23:37:27 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <87obfgjaih.fsf@dell.be.48ers.dk>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <201302191914.43962.yann.morin.1998@free.fr>
 <87obfgjaih.fsf@dell.be.48ers.dk>
Message-ID: <201302212337.27395.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On Tuesday 19 February 2013 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> Peter, you agreed on both points, which are the opposites one of
>  Yann> the other.  What should I conclude about this: do the change, or
>  Yann> not do the change?
> 
> Huh, Arnout's first comment was about the defconfigs /
> BR2_TARGET_ROOTFS_EXT{2,} change, which we both dislike - And the 2nd
> was about the fs/ renames which should be transparent to the user.

Ah, OK. So I drop the defocnfig changes, but keep the fs renames.

(Funny how I mis-understood the answer. And funny how I missed
this reply two days ago... :-( )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
