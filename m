From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 6 Nov 2006 10:59:17 +0100
Subject: [Buildroot] echo cat, segfault with char device
Message-ID: <20061106095917.GB5528@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I do "echo "12" > 12" echo from busybox works fine, but if I try to
cat or echo something into a char device sometimes I get a segfault, and
sometimes the whole system hangs.
Sometimes the System hangs first time and I can C-c out, but never on
the second time.

I have generated a gcc-3.4.6-uClibc-0.9.28 softfload toolchain with
arm920t as a target. As I can see the other stuff works fine, inspite of
the cat and echo error.

Does some experienced guru know, where I have to poke into the sytem to
get the bug? May be the bug sits in fron of the screen though...

Any uClibc or other option known to trigger some behaviour?

I activated NPTL AFAIK, could this cause such an error?

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
