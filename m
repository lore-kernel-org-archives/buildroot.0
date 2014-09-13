From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 23:51:51 +0200
Subject: [Buildroot] [PATCH 1/1] sqlite: add option to disable fsync
In-Reply-To: <1410450212-30718-2-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Thu, 11 Sep 2014 17:43:32 +0200")
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
 <1410450212-30718-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87egvf6vew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > For use-cases in which performance is more important than data integrity.
 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
