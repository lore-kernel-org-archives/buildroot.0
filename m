From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 21:55:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cramfs: Needs zlib
In-Reply-To: <1415460586-14317-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 8 Nov 2014 16:29:46 +0100")
References: <1415460586-14317-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y4rltnsx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > cramfs.mk contains
 > CRAMFS_DEPENDENCIES = zlib

 > but this dependency was missing in Config.in.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Changed "depends on" to "select"

Committed, thanks.

-- 
Bye, Peter Korsgaard
