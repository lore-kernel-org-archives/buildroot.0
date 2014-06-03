From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Jun 2014 20:59:04 +0200
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.1.8
In-Reply-To: <1401803716-13253-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Jun 2014 10:55:16 -0300")
References: <1401803716-13253-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ioohsttz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-0178 (Malformed FSCTL_SRV_ENUMERATE_SNAPSHOTS response)
 > and CVE-2014-0239 (dns: Don't reply to replies).
 > Patches 0001 and 0002 are now part of the 4.1.x release branch.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
