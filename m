From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 14:30:53 +0100
Subject: [Buildroot] [PATCH] dropbear: bump to version 2013.56
In-Reply-To: <1363888943-843-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 21 Mar 2013 15:02:23 -0300")
References: <1363888943-843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2uokjqq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Switch ECHOs to SEDs to avoid issues with defines changing after
 Gustavo> sysoptions.h was included - and it's cleaner.
 Gustavo> Enable hmac-sha2-256 and hmac-sha2-512 support for the full featured.

Committed, thanks.

-- 
Bye, Peter Korsgaard
