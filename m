From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Oct 2015 17:14:46 +0200
Subject: [Buildroot] [git commit] tstools: GitHub migration
In-Reply-To: <20151020143645.F3EB4818D4@busybox.osuosl.org>
References: <20151020143645.F3EB4818D4@busybox.osuosl.org>
Message-ID: <20151020171446.5db7b297@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Vicente,

On Tue, 20 Oct 2015 16:33:07 +0200, Peter Korsgaard wrote:

> - Wrap the help text in the Config.in to 72 characters, and also change
>   the project URL to the GitHub one.

Hhh...


> -	  This is a set of cross-platform command line tools for
> -	  working with MPEG data
> +	  This is a set of cross-platform command line tools for working with
> +	  MPEG data.

This clearly doesn't fit in 72 characters now, except if you count tab
as one character of course. emacs says that the long line here is now
77 characters long.

So basically, the previous wrapping was more correct, IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
