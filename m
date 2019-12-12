From: rscr <rafacrespiramon@gmail.com>
Date: Thu, 12 Dec 2019 00:59:37 -0600 (CST)
Subject: [Buildroot] Custom tarball and .config file
In-Reply-To: <1575986333615-0.post@n4.nabble.com>
References: <1575964472511-0.post@n4.nabble.com>
 <20191210141145.5969eb63@windsurf> <1575986333615-0.post@n4.nabble.com>
Message-ID: <1576133977989-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

I have realised that in /dl directory I had an old linux kernel version that
I was not cleaned with "distclean", so I think buildroot was using all time
that version, which did not include the kernel driver yet.

So first I will clean correctly the /dl directory and I will try again

Kind Regards, 

Rafa



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
