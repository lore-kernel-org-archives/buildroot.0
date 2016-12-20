From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 21:23:29 +0100
Subject: [Buildroot] [PATCH] gdk-pixbuf: security bump to version 2.36.2
In-Reply-To: <20161220194548.4683-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 20 Dec 2016 16:45:48 -0300")
References: <20161220194548.4683-1-gustavo@zacarias.com.ar>
Message-ID: <87eg1273jy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > * Fix a NULL pointer dereference (#776026)
 > * Fix a memory leak (#776020)
 > * Avoid a buffer overrun in the qtif loader ($#775648)
 > * Fix a crash in the bmp loader (#775242)
 > * Fix crash opening pnm images with large dimensions (#775232)
 > * Prevent buffer overflow in the pixdata loader (#775693)

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
