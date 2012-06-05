From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 14:18:49 +0200
Subject: [Buildroot] [PATCH] mediastreamer: disable test programs
In-Reply-To: <1338897993-12121-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 5 Jun 2012 14:06:33 +0200")
References: <1338897993-12121-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87ipf6ost2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Building tests produces an error during the "OBJCLD mediastream" phase with
 Luca> some toolchains/architectures.

 Luca> This is supposed to fix:
 Luca>  - http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2
 Luca>  - http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a
 Luca>  - http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5

Committed, thanks.

-- 
Bye, Peter Korsgaard
