From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 13 Apr 2011 19:58:06 +0200
Subject: [Buildroot] Unix mail command?
In-Reply-To: <4DA5B60E.2060701@michaelburghart.de>
References: <4DA5B60E.2060701@michaelburghart.de>
Message-ID: <BANLkTim9Qzo6EqBU9j+7aiJoFMAZM7qPsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/4/13 Michael Burghart <mb@michaelburghart.de>:
> sorry for the silly question but where is the standard UNIX mail command
> located?! Need it and cannot find it :)

Unless you're talking about a buildroot fs;

daniel at proliant:~$ which mail
/usr/bin/mail
daniel at proliant:~$

But on some systems it's not installed by default. It's to very little
use on a desktop system.
