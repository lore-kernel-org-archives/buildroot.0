From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Mar 2019 16:20:23 +0100
Subject: [Buildroot] [PATCH] package/file: security bump to version 5.36
In-Reply-To: <cd8c9e5890d36e5b0c3d8a895ff19f2d361f4a27.1552392750.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Mar 2019 14:12:30 +0200")
References: <cd8c9e5890d36e5b0c3d8a895ff19f2d361f4a27.1552392750.git.baruch@tkos.co.il>
Message-ID: <87imwof7bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2019-8906: do_core_note in readelf.c in libmagic.a in file 5.35 has
 > an out-of-bounds read because memcpy is misused.

 > CVE-2019-8904: do_bid_note in readelf.c in libmagic.a in file 5.35 has a
 > stack-based buffer over-read, related to file_printf and file_vprintf.

 > Update license files hashes; removal of trailing white spaces.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
