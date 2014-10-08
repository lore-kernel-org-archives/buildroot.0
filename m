From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 19:36:55 +0200
Subject: [Buildroot] [PATCH 5/5] sysklogd: security bump to version 1.5.1
In-Reply-To: <1412774389-11297-5-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 10:19:49 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 <1412774389-11297-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wq8acvk8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-3634 - invalid priority values between 192 and 1023
 > (directly or arrived at via overflow wraparound) can propagate through
 > code causing out-of-bounds access to the f_pmask array within the
 > 'filed' structure by up to 104 bytes past its end.

 > Switch to vanilla since Debian hasn't handled this yet and add hash
 > file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
