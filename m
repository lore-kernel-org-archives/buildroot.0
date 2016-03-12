From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 00:05:51 +0100
Subject: [Buildroot] [PATCH 1/1] putty: add new package
In-Reply-To: <56E279AD.1050601@lespocky.de>
References: <1457678759-11688-1-git-send-email-post@lespocky.de>
 <20160311070500.GF2057@tarshish> <56E279AD.1050601@lespocky.de>
Message-ID: <20160312230551.GM3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2016-03-11 08:54 +0100, Alexander Dahl spake thusly:
> Hei hei,
> 
> On 11.03.2016 08:05, Baruch Siach wrote:
> > On Fri, Mar 11, 2016 at 07:45:59AM +0100, Alexander Dahl wrote:
> >> +	help
> >> +	  PuTTY is a free SSH and Telnet client
> >> +
> >> +	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
> > 
> > It might be useful to note here that the putty program itself depends on gtk2. 
> > Without gtk2, only command line utilities (pscp, plink, etc.) are built.
> 
> You mean in the help text there? I know this is the case, but it might
> be a good idea to make it a little more explicit, yes.

Yes, in the help text. Something like:

    help
      PuTTY is a free SSH and Telnet client.

      Without GTK2, onlt the command line utilities ar ebuilt; enable
      GTK2 for the graphical client.

      http://www.chiark.greenend.org.uk/~sgtatham/putty/

Regards,
Yann E. MORIN.

> Greets
> Alex
> 
> -- 
> ?With the first link, the chain is forged. The first speech censured,
> the first thought forbidden, the first freedom denied, chains us all
> irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
> *** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***
> 



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
