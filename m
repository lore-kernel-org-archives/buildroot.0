From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:29:13 +0100
Subject: [Buildroot] [PATCH v2 2017.02.x 1/1] postgresql: security bump
 to 9.6.7
In-Reply-To: <20180212121216.23280-1-aduskett@gmail.com> (Adam Duskett's
 message of "Mon, 12 Feb 2018 07:12:16 -0500")
References: <20180212121216.23280-1-aduskett@gmail.com>
Message-ID: <874lmilz6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > from https://www.postgresql.org/about/news/1829/
 > Fixes:
 > [1] CVE-2018-1052: Fix the processing of partition keys containing multiple
 >                    expressions

 > [2] CVE-2018-1053: Ensure that all temporary files made with "pg_upgrade" are
 >                    non-world-readable

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 > ---
 > Changes V1 -> v2:
 >   - Fixed license file sha256sum
 >   - Fixed subject-prefix (Thomas)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
