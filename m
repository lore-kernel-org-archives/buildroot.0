From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 15:44:55 +0100
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p6
In-Reply-To: <1453295928-30116-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 20 Jan 2016 10:18:48 -0300")
References: <1453295928-30116-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t9cux7c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > CVE-2015-7973 - Deja Vu: Replay attack on authenticated broadcast mode
 > CVE-2015-7974 - Skeleton Key: Missing key check allows impersonation
 > between authenticated peers
 > CVE-2015-7975 - nextvar() missing length check
 > CVE-2015-7976 - ntpq saveconfig command allows dangerous characters in
 > filenames
 > CVE-2015-7977 - reslist NULL pointer dereference
 > CVE-2015-7978 - Stack exhaustion in recursive traversal of restriction
 > list
 > CVE-2015-7979 - Off-path Denial of Service (DoS) attack on authenticated
 > broadcast mode
 > CVE-2015-8137 - origin: Zero Origin Timestamp Bypass
 > CVE-2015-8158 - Potential Infinite Loop in ntpq

Wow :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
