From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 12:46:02 +0100
Subject: [Buildroot] [PATCH] sqlcipher: fix build for xtensa
In-Reply-To: <7bfe4579b836ff4734d77ddaca7caaeb80c050c3.1390470832.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 23 Jan 2014 11:53:52 +0200")
References: <7bfe4579b836ff4734d77ddaca7caaeb80c050c3.1390470832.git.baruch@tkos.co.il>
Message-ID: <87ha8uc45h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The sqlcipher package generates libraries that are too large for the xtensa
 > default placement of literals in a dedicated section. Use
 > -mtext-section-literal to place literals in the text section.

 > Fixes:
 > http://autobuild.buildroot.net/results/921/92116c2837e4c449919e7a0ab9aebd6abb1cbaf1/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
