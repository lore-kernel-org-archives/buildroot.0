From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 18:52:09 +0100
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.17
In-Reply-To: <1452192412-29164-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 7 Jan 2016 15:46:52 -0300")
References: <1452192412-29164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t9sdkmu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Bug #70976 (Memory Read via gdImageRotateInterpolated Array Index Out of
 > Bounds).
 > Bug #70755 (fpm_log.c memory leak and buffer overflow).
 > Bug #70661 (Use After Free Vulnerability in WDDX Packet
 > Deserialization).
 > Bug #70741 (Session WDDX Packet Deserialization Type Confusion
 > Vulnerability).
 > Bug #70728 (Type Confusion Vulnerability in PHP_to_XMLRPC_worker()).

 > No CVEs assigned yet.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
