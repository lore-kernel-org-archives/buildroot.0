From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2014 12:44:48 +0200
Subject: [Buildroot] [PATCH] libxml2: security bump to version 2.9.2
In-Reply-To: <1413486160-7541-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 16 Oct 2014 16:02:40 -0300")
References: <1413486160-7541-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87egu7dlgf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-3660 - billion laugh variant
 > CVE-2014-0191 - Do not fetch external parameter entities

 > Also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
