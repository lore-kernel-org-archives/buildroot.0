From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 20 Aug 2018 14:41:27 -0300 (BRT)
Subject: [Buildroot] [PATCH] liburiparser: bump to version 0.8.6
In-Reply-To: <87sh392brh.fsf@dell.be.48ers.dk>
References: <20180820001208.10551-1-casantos@datacom.com.br>
 <87sh392brh.fsf@dell.be.48ers.dk>
Message-ID: <146368874.1687439.1534786887521.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Bernd Kuhls" <bernd.kuhls@t-online.de>
> Sent: Monday, August 20, 2018 2:22:58 PM
> Subject: Re: [PATCH] liburiparser: bump to version 0.8.6

>>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:
> 
> > Version 0.8.6 is a bugfix release including a nasty bug that has
> > potential to crash applications when parsing certain URIs (like
> > "//:%aa@", excluding quotes).
> 
> > For more details please check the change log at
> 
> >     https://github.com/uriparser/uriparser/blob/uriparser-0.8.6/ChangeLog
> 
> > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> 
> Committed, thanks.
> 
> When was this issue introduced? 2018.02.x has 0.8.4.

Looking a the code it seems to predate 0.8.4 by several years since it
fixes a function that was introduced in 2008:

   https://github.com/uriparser/uriparser/commit/451eb07f3a289e0d1b7800629f4814bf6b48c121

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
