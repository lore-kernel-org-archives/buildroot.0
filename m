From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 21:01:19 +0200
Subject: [Buildroot] [PATCH] squid: security bump to version 3.5.17
In-Reply-To: <1461177490-20156-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 20 Apr 2016 15:38:10 -0300")
References: <1461177490-20156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bn54cdfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > SQUID-2016:5 (CVE-2016-4051) - Buffer overflow in cachemgr.cgi
 > SQUID-2016:6 (CVE-2016-4052) - Multiple issues in ESI processing.
 > CVE-2016-4053 & CVE-2016-4054 which are part of SQUID-2016:6.

 > Switch to xz-compressed tarball as well.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
