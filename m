From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Mar 2016 22:33:38 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.3.6
In-Reply-To: <1457472680-16241-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 8 Mar 2016 18:31:20 -0300")
References: <1457472680-16241-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d1r44pu5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-7560 - Authenticated client could cause Samba to overwrite ACLs
 > with incorrect owner/group.
 > CVE-2016-0771 - Malicious request can cause the Samba internal DNS
 > server to crash or unintentionally return uninitialized memory.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
