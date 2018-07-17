From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:26:10 +0200
Subject: [Buildroot] [PATCH] gnupg2: security bump to version 2.2.8
In-Reply-To: <a618f70f53764800a03a9dc414bc6b8fb77459f4.1528732392.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 11 Jun 2018 18:53:12 +0300")
References: <a618f70f53764800a03a9dc414bc6b8fb77459f4.1528732392.git.baruch@tkos.co.il>
Message-ID: <87zhyqnx0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-12020: Unsanitized file names might cause injection of
 > terminal control characters into the status output of gnupg.

 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
