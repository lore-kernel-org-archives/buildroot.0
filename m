From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:55:09 +0100
Subject: [Buildroot] [PATCH] package/vorbis-tools: add upstream security
 fixes for CVE-2014-96{38, 39, 40}
In-Reply-To: <20200204151819.22175-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Feb 2020 16:18:19 +0100")
References: <20200204151819.22175-1-peter@korsgaard.com>
Message-ID: <87blp4orpu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2014-9638: oggenc in vorbis-tools 1.4.0 allows remote attackers to
 >   cause a denial of service (divide-by-zero error and crash) via a WAV file
 >   with the number of channels set to zero.

 > - CVE-2014-9639: Integer overflow in oggenc in vorbis-tools 1.4.0 allows
 >   remote attackers to cause a denial of service (crash) via a crafted number
 >   of channels in a WAV file, which triggers an out-of-bounds memory access.

 > - CVE-2014-9640: oggenc/oggenc.c in vorbis-tools 1.4.0 allows remote
 >   attackers to cause a denial of service (out-of-bounds read) via a crafted
 >   raw file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
