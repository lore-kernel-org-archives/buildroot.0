From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:03:57 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/irqbalance: fix systemd
 startup script (add RuntimeDirectory)
In-Reply-To: <20210220163349.25244-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 20 Feb 2021 17:33:49 +0100")
References: <20210220163349.25244-1-ps.report@gmx.net>
 <20210220163349.25244-2-ps.report@gmx.net>
Message-ID: <87mtvps7zm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add RuntimeDirectory=irqbalance to create /run/irqbalanace needed to
 >   create socket /run/irqbalance/irqbalance<pid>.sock

 > Fixes:

 >   - Bug 13541 [1]

 >   /usr/sbin/irqbalance[158]: Daemon couldn't be bound to the file-based socket.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=13541

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
