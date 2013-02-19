From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Feb 2013 19:14:43 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <87ppzwh3vw.fsf@dell.be.48ers.dk>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <512327AD.3040703@mind.be> <87ppzwh3vw.fsf@dell.be.48ers.dk>
Message-ID: <201302191914.43962.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout, All,

On Tuesday 19 February 2013 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  Arnout> On 18/02/13 00:10, Yann E. MORIN wrote:
>  >> Update defconfigs and boards readmes accordingly.
> 
>  Arnout>  I don't really like this. I think it falls in the category "yes it
>  Arnout> would make things more consistent, but it's major API breakage that
>  Arnout> may make upgrading unnecessarily difficult". Peter decided to be more
>  Arnout> careful with that kind of changes, and rightly so.
> 
> Agreed.
> 
>  Arnout>  This rename is useful, though, and it shouldn't hurt anyone. If
>  Arnout> anyone is using it, it will be pretty clear what happened, and it wil
>  Arnout> draw their attention to the new features of genextfs.sh.
> 
> Agreed.

OK, I'm puzzled. 8-/

Peter, you agreed on both points, which are the opposites one of the other.
What should I conclude about this: do the change, or not do the change?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
