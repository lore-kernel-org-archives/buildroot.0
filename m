From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:21:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/wavpack: security bump to
 version 5.2.0
In-Reply-To: <20191218222319.1259596-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Dec 2019 23:23:18 +0100")
References: <20191218222319.1259596-1-fontaine.fabrice@gmail.com>
Message-ID: <87a77iu1i9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch to github to get latest version
 > - Drop patches (already in version)
 > - Fix CVE-2018-19840: The function WavpackPackInit in pack_utils.c in
 >   libwavpack.a in WavPack through 5.1.0 allows attackers to cause a
 >   denial-of-service (resource exhaustion caused by an infinite loop) via
 >   a crafted wav audio file because WavpackSetConfiguration64 mishandles
 >   a sample rate of zero.
 > - Fix CVE-2018-19841: The function WavpackVerifySingleBlock in
 >   open_utils.c in libwavpack.a in WavPack through 5.1.0 allows attackers
 >   to cause a denial-of-service (out-of-bounds read and application
 >   crash) via a crafted WavPack Lossless Audio file, as demonstrated by
 >   wvunpack.
 > - Add hash for license file

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
