From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:03:52 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/irqbalance: fix sysv startup
 script (add mkdir /run/irqbalance)
In-Reply-To: <20210220163349.25244-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 20 Feb 2021 17:33:48 +0100")
References: <20210220163349.25244-1-ps.report@gmx.net>
Message-ID: <87r1l1s7zr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add mkdir -p /run/irqbalance to sysv startup script needed to
 >   create socket /run/irqbalance/irqbalance<pid>.sock

 > Fixes:

 >   - Bug 13541 [1]

 >   daemon.warn /usr/sbin/irqbalance: Daemon couldn't be bound to the file-based socket.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=13541

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
