From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 12 May 2011 09:22:10 +0200
Subject: [Buildroot] [Bug 3703] New: Consider using /usr/bin/env bash in
	scripts
In-Reply-To: <bug-3703-163@https.bugs.busybox.net/>
References: <bug-3703-163@https.bugs.busybox.net/>
Message-ID: <BANLkTi=swMoHKPhfKQYvhCSC9ucoykuCbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/5/11  <bugzilla@busybox.net>:
> https://bugs.busybox.net/show_bug.cgi?id=3703
> On FreeBSD bash will not be inside /bin/bash but will be in
> /usr/local/bin/bash, by using /usr/bin/env bash one can have a script that
> works well with a Linux system and FreeBSD.

Does Buildroot build on FreeBSD?
