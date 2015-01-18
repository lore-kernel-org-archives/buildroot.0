From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 16:11:55 +0100
Subject: [Buildroot] [PATCH V2] dvd+rw-tools: new package
In-Reply-To: <54BB3538.6050206@ou.edu>
References: <54B9B774.9030204@ou.edu>
 <XnsA425C51B017E9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <54BB3538.6050206@ou.edu>
Message-ID: <20150118151155.GK4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2015-01-17 22:23 -0600, Steve Kenton spake thusly:
> > according to Beyond Linux From Scratch you need libisoburn or a similar 
> > package which provides xorrisofs, otherwise "the growisofs command will not 
> > function properly"
> > http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html
> 
> I look at the LFS information again and it brings up another points. Linux From
> Scratch patches dvd+rw-tools to replace mkisofs from the cdrtools package
> with xorrisofs from GNU xorriso.
> 
> I have also been experimenting with the cdrtools 3.01 pre-release package.
> The controversy about whether the CDDL license is GPL compatible is beyond
> me. Would the buildroot project be likely to accept a cdrtools submission
> or should I also patch dvd+rw-tools to to use the xorriso equivalents to the
> cdrtools programs? I missed that and need to do one or the other I guess.

Well, we do not try to resolve license dependencies and/or incompatibilities.
We are not lawyers, so we lack the knowledge to do so.

Instead, we just list the licenses, and leave out to the user (or their
legal team) to sort out such incompatibilities, should they believe
there are.

So, my suggestion would be to just list the licenses as exhaustively as
possible, and be done with that.

So yes, we'd accept such a package. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
