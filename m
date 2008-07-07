From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 13:59:20 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <6B372872A6BB489BB9F8883C6E91E34A@aeglos> (Ulf Samuelsson's
	message of "Mon\, 7 Jul 2008 13\:18\:25 +0200")
References: <20080705092238.AB5163C65B@busybox.net>
	<87bq1ag4zs.fsf@macbook.be.48ers.dk> <48714AA0.8000809@atmel.com>
	<871w26dwua.fsf@macbook.be.48ers.dk>
	<6B372872A6BB489BB9F8883C6E91E34A@aeglos>
Message-ID: <877ibx9a7b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> And, is that a problem? This will break if someone forgets the
 >> trailing slash. Double slashes are normally fine.
 >> 

 Ulf> Anyone likely to redefine TOPDIR?

Yes, if we fix up buildroot to proper support building out of tree
like discussed on the list recently.

 Ulf> Just some debugging help
 >> 
 >> Does it need to be checked in?

 Ulf> Not neccesarily, but does it hurt?

Well, it's extra clutter - I don't see why those 3 variables are
particular interesting in general.

-- 
Bye, Peter Korsgaard
