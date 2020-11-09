From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 10:49:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/ghostscript: fix build with
 freetype >= 2.10.3
In-Reply-To: <20201106214932.3051852-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 6 Nov 2020 22:49:31 +0100")
References: <20201106214932.3051852-1-bernd.kuhls@t-online.de>
Message-ID: <87wnyuvp0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This patch is needed to fix the build with freetype >= 2.10.3.
 > https://www.freetype.org/index.html#news
 > "A warning for distribution maintainers: Version 2.10.3 and later may
 >  break the build of ghostscript, due to ghostscript's use of a with-
 >  drawn macro that wasn't intended for external usage."

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
