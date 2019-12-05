From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 21:38:12 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/lzma: add license
In-Reply-To: <20191128201726.20439-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Nov 2019 21:17:26 +0100")
References: <20191128201726.20439-1-fontaine.fabrice@gmail.com>
Message-ID: <87a786qzij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - lzma program is licensed under GPL-2.0+
 > - lzmadec program has not license information in source file
 > - lzmainfo program is licensed under LGPL-2.1+
 > - LzmaDecode.h is licensed under LGPL-2.1+ (or CPL) as stated in
 >   src/sdk/7zip/Compress/LZMA_C/LzmaDecode.{c,h}, other sdk files have no
 >   license information
 > - lzmore and lzgrep scripts are licensed under GPL-2.0+
 > - lzdiff script has no license information
 > - basic and perms tests are licensed under GPL-3.0+
 > - mkdtemp and test-lib.sh tests have no license information

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Add details in LZMA_LICENSE

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
