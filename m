From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 11 Apr 2011 10:55:49 +0200
Subject: [Buildroot] Starting programs in the background at init time:
 stdin EOF problem
In-Reply-To: <BANLkTi=Vx9c7OJ0arjwmrr6=WcTYFUfpyA@mail.gmail.com>
References: <BANLkTi=Vx9c7OJ0arjwmrr6=WcTYFUfpyA@mail.gmail.com>
Message-ID: <BANLkTi=qUjcrhX92_WCRXyaCSNxwscDtPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

2011/4/11 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
> What is the recommended way to start programs in such an embedded
> environment?

I'm using start-stop-daemon to perform similar tasks. Have you given
it a try? It can "daemonize" even non-daemons which is pretty nice for
e.g. GUI softwares.
