From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:37:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: security bump
 version to 1.9.1
In-Reply-To: <20210129121831.973764-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 29 Jan 2021 13:18:31 +0100")
References: <20210129121831.973764-1-bernd.kuhls@t-online.de>
Message-ID: <87im7evhgg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch which was applied upstream.
 > Release notes:
 > https://lists.gnupg.org/pipermail/gnupg-announce/2021q1/000456.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

I see a notice that it fails to build with --disable-asm (which we pass
for m68k coldfire), but I just did a test and it builds here:

https://dev.gnupg.org/T5277

-- 
Bye, Peter Korsgaard
