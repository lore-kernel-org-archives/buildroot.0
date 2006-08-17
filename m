From: <bogus@does.not.exist.com>
Date: Thu, 17 Aug 2006 01:58:45 -0000
Subject: No subject
Message-ID: <mailman.12.1164378087.4264.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ccache is a fast compiler cache. It is used as a front end to your compiler to safely cache compilation output. When the same code is compiled again the cached output is used giving a significant speedup (typically 5x).


Is this 5x speedup overstated, or why do you have no need for it?

-------- Original-Nachricht --------
Datum: Fri, 24 Nov 2006 15:10:47 +0100
Von: Bernhard Fischer <rep.nop@aon.at>
An: "Matthias G?lck" <Real.Magic@gmx.de>
Betreff: Re: [Buildroot] problem with absolute paths to tools in ccache

> On Fri, Nov 24, 2006 at 03:06:43PM +0100, "Matthias G?lck" wrote:
> >Thanks for your quick response.
> 
> Well, it was not really helpful, i think.
> 
> >Could you please tell me, why you do not use ccache?
> 
> I simply have no need for it.

-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
