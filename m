From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 16:22:07 +0100
Subject: [Buildroot] [PATCH v2] package/shairport-sync: fix init script
 (stop)
In-Reply-To: <20181220221838.21000-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Thu, 20 Dec 2018 20:18:38 -0200")
References: <20181220221838.21000-1-casantos@datacom.com.br>
Message-ID: <87lg44s8rk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > shairport-sync creates its pidfile at /var/run/shairport-sync/, so pass
 > that path to start-stop-daemon in the stop operation.

 > Also pass the executable path, allowing start-stop-daemon to check if
 > the PID matches the shairport-sync process, preventing killing some
 > other inocent daemon.

 > Fixes:
 >   https://bugs.busybox.net/show_bug.cgi?id=11566

 > Reported-by: Bin Zhang <yangtze31@gmail.com>
 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Changes v1->v2
 >   - Recreated patch with the PID checking part

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
