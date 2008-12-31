From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 31 Dec 2008 09:04:14 +0900
Subject: [Buildroot] Can't Login to New System
In-Reply-To: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
References: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
Message-ID: <200812310904.15593.jk@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrew,

> ttyAM0 is a serial port.

You'll need to add ttyAM0 to /etc/securetty in order to log in as root 
on this console.

Cheers,


Jeremy
