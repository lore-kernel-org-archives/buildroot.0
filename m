From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 23:02:20 +0100
Subject: [Buildroot] [PATCH] busybox: security bump to version 1.24.2
In-Reply-To: <1458942992-10172-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 25 Mar 2016 18:56:32 -0300")
References: <1458942992-10172-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3eydxn7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The version bump doesn't inherently fix the security issues, however the
 > added CVE patches do, which fix:

 > CVE-2016-2147 - out of bounds write (heap) due to integer underflow in
 > udhcpc.
 > CVE-2016-2148 - heap-based buffer overflow in OPTION_6RD parsing.

 > Drop patches that are upstream as well.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I also have problems applying this one:

Applying: busybox: security bump to version 1.24.2
.git/rebase-apply/patch:190: space before tab in indent.
        int t;
.git/rebase-apply/patch:193: space before tab in indent.
        smallint alreadyseen = tokpushback;
.git/rebase-apply/patch:196: space before tab in indent.
        /*
.git/rebase-apply/patch:197: space before tab in indent.
         * eat newlines
.git/rebase-apply/patch:198: space before tab in indent.
         */
fatal: corrupt patch at line 444
Patch failed at 0001 busybox: security bump to version 1.24.2

-- 
Bye, Peter Korsgaard
