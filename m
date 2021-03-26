From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:47:03 +0100
Subject: [Buildroot] [PATCH] package/libressl: security bump to 3.2.5
In-Reply-To: <20210320230337.1841-1-ismael@iodev.co.uk> (Ismael Luceno's
 message of "Sun, 21 Mar 2021 00:03:37 +0100")
References: <20210320230337.1841-1-ismael@iodev.co.uk>
Message-ID: <87pmzlilco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ismael" == Ismael Luceno <ismael@iodev.co.uk> writes:

 > It includes the following bug fix:
 >  * A TLS client using session resumption may cause a use-after-free.

 > https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.5-relnotes.txt

 > Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

Committed to 2020.11.x and 2021.02.x, thanks.

It it not really clear to me if this is only an issue in 3.2.x /
TLSv1.3?

-- 
Bye, Peter Korsgaard
