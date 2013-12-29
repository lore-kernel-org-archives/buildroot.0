From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 17:59:21 +0100
Subject: [Buildroot] [PATCH 0/9] iso9660/grub improvements
In-Reply-To: <20131229121939.46f10296@skate>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131229121939.46f10296@skate>
Message-ID: <20131229165920.GC3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-29 12:19 +0100, Thomas Petazzoni spake thusly:
> On Sat, 28 Dec 2013 15:56:31 +0100, Thomas Petazzoni wrote:
> 
> > Here is a set of commits that improves the iso9660/grub handling:
> > 
> >  * Ensures that grub is built with the iso9660 support when the
> >    iso9660 image format has been selected.
> > 
> >  * Add splashscreen support to Grub for the iso9660 image mechanism.
> > 
> >  * Do not include the initrd into the filesystem if it is built into
> >    the kernel image itself.
> > 
> >  * Related improvements/fixes
> 
> I have applied patches 1, 2, 3, 4 and 7. For patches 5, 6, 8 and 9, I'm
> waiting for Yann's Acked-by, or someone else Acked-by :)

I guess you can also apply patch 6/9 as I reviewed it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
