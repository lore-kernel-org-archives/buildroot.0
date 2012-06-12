From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Jun 2012 22:27:19 +0200
Subject: [Buildroot] [PATCH 1/2] polarssl: bump to version 1.1.4
In-Reply-To: <1339447247-7801-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 11 Jun 2012 17:40:46 -0300")
References: <1339447247-7801-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8762awz36g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Correctly handle empty SSL/TLS packets (Found by James Yonan)
 Gustavo> * Fixed potential heap corruption in x509_name allocation
 Gustavo> * Fixed single RSA test that failed on Big Endian systems

Committed, thanks.

-- 
Bye, Peter Korsgaard
