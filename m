From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:29:58 +0200
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <20150405090500.GA4134@free.fr>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20150404195923.154d3366@free-electrons.com>
 <20150405090500.GA4134@free.fr>
Message-ID: <20150405112958.781b5523@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 5 Apr 2015 11:05:00 +0200, Yann E. MORIN wrote:

> > Should we introduce a final check in target-finalize to warn about
> > binaries having invalid rpaths, and start fixing them one by one ? Or a
> > more brutal approach where we remove all rpaths in target-finalize ?
> 
> I have a series doing exactly that; I'll be sending it shortly.

There was some concern in this thread that the approach to remove the
rpath at the end of the build was indeed making the built-in rpath
ineffective, but still present if you did a "strings" on the binary. Is
this something you have a solution for?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
