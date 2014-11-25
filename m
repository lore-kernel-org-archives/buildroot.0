From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 25 Nov 2014 20:01:24 -0300
Subject: [Buildroot] [PATCH v4 0/9] target permissions
In-Reply-To: <20141122190233.314a6e48@free-electrons.com>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <20141122190233.314a6e48@free-electrons.com>
Message-ID: <20141125230124.GA16987@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 22, 2014 at 07:02:33PM +0100, Thomas Petazzoni wrote:
> Dear Guido Mart?nez,
> 
> On Fri, 21 Nov 2014 13:18:59 -0300, Guido Mart?nez wrote:
> 
> > Guido Mart?nez (9):
> [...]
> >   nitrogen6x: use install instead of cp
> >   boot/grub: use install instead of cp
> >   fs/iso9660: use install instead of cp
> 
> I've applied those three patches to the next branch. The other ones are
> more sensitive, so I'll wait to get more feedback/review, but applying
> those three patches means you'll have less patches to carry in your
> branch :)
Thanks Thomas!

I agree the other require a bit more feedback. Even though I have been
using them for a while with no problems, one can't be sure enough when
touching this kind of stuff :)

BTW, patch #2 was Reviewed-by Yann on the previous patchset. It's the
exact same patch. Same for #4 (was #3), except for a minor change in the
commit log.

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
