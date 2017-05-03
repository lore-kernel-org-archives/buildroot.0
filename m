From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 May 2017 23:14:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] openssh: add support for HW SSL
	engines
In-Reply-To: <1492520583-13537-1-git-send-email-gilad@benyossef.com> (Gilad
 Ben-Yossef's message of "Tue, 18 Apr 2017 16:03:03 +0300")
References: <1492520583-13537-1-git-send-email-gilad@benyossef.com>
Message-ID: <874lx1d4nq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilad" == Gilad Ben-Yossef <gilad@benyossef.com> writes:

 > Enable support for OpenSSH to use a hardware SSL engine if
 > cryptodev-linux is included. Without this, OpenSSH uses only
 > OpenSSL software crypto implementation.

 > Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
 > CC: Baruch Siach <baruch@tkos.co.il>
 > CC: Arnout Vandecappelle <arnout@mind.be>
 > ---

 > Changes from v1:
 > Incorporated style feedback from Baruch and Arnout.

Committed, thanks.

-- 
Bye, Peter Korsgaard
