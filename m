From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:26:17 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.23
In-Reply-To: <8c0af0af39244f35c59dc5d9fb92f9369b831088.1528733323.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 11 Jun 2018 19:08:43 +0300")
References: <8c0af0af39244f35c59dc5d9fb92f9369b831088.1528733323.git.baruch@tkos.co.il>
Message-ID: <87va9enx0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-12020: Unsanitized file names might cause injection of
 > terminal control characters into the status output of gnupg.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
