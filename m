From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:44:13 +0200
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.5.4
In-Reply-To: <1476314247-26581-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 12 Oct 2016 20:17:27 -0300")
References: <1476314247-26581-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87inswolaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-5423 - CASE/WHEN with inlining can cause untrusted pointer
 > dereference (bsc#993454).
 > CVE-2016-5424 - Fix client programs' handling of special characters in
 > database and role names (bsc#993453).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
