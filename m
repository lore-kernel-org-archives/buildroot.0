From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Apr 2013 17:53:21 +0200
Subject: [Buildroot] [pull request v4] Pull request for branch yem-ext234
In-Reply-To: <87fvyvrjia.fsf@dell.be.48ers.dk>
References: <cover.1365718555.git.yann.morin.1998@free.fr>
 <87fvyvrjia.fsf@dell.be.48ers.dk>
Message-ID: <20130412155321.GA3186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Fri, Apr 12, 2013 at 03:00:45PM +0200, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  Yann> This patch series enhances the ext2 fs backend to also build ext3
>  Yann> and ext4 filesystems, and differentiate between ext2 rev0 and
>  Yann> ext2 rev1 filesystems.
[--SNIP--]
> Notice: I did a quick test with a smallish ext4 (3.5MB) filesystem,
> where the 1081 blocks extra for the journal wasn't enough, so I've
> increased it to 1300 instead.

Strange, Thomas had the same issue, which I was notable to reproduce
here with a basic busybox-only file system (roughly 3.5MiB here too).

Anyway, thanks for the fix up. Indeed, systems going for ext3/4 will
probably not be much impacted by the few extra sectors.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
