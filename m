From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:45:44 +0200
Subject: [Buildroot] [PATCH master] busybox: add upstream security fixes
In-Reply-To: <cf05d959586b416bbae83f437fd84e66b3243776.1518540701.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Feb 2018 18:51:41 +0200")
References: <cf05d959586b416bbae83f437fd84e66b3243776.1518540701.git.baruch@tkos.co.il>
Message-ID: <87lgdu6b9j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-15873: Integer overflow in decompress_bunzip2.c leads to a read
 > access violation

 > CVE-2017-15874: Integer overflow in decompress_unlzma.c leads to a read
 > access violation

 > Cc: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---

 > This is only applicable to master. These fixes are already in version
 > 1.28.0 that is now in next.

 > Care should be take to remove these patches when next is merged into
 > master.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
