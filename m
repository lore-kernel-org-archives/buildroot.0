From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Sep 2011 00:00:14 +0200
Subject: [Buildroot] [PATCH] ext-toolchain: fix download url
In-Reply-To: <CAPCu-pSkmTLjiRQc2XD24NcairMHeAAj_w-VkpgXR5AFcCTpCA@mail.gmail.com>
 (C. A.'s message of "Mon, 12 Sep 2011 16:01:17 -0500")
References: <CAPCu-pSkmTLjiRQc2XD24NcairMHeAAj_w-VkpgXR5AFcCTpCA@mail.gmail.com>
Message-ID: <87ipox5slt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "C" == C A, Subramaniam <subramaniam.ca@ti.com> writes:

 >> From a260d781f4c82a3ce2c56f23f1e30a42307fc454 Mon Sep 17 00:00:00 2001
 C> From: Subramaniam C.A <subramaniam.ca@ti.com>
 C> Date: Mon, 12 Sep 2011 15:59:20 -0500
 C> Subject: [PATCH] ext-toolchain: fix download url

 C> The website for downloading the toolchain has changed
 C> from http://www.codesourcery.com to http://sourcery.mentor.com

Thanks, committed. Notice that your mailer had corrupted whitespace /
wordwrapped the patch so I had to fix it up manually. Please consider
using git send-email in the future.

-- 
Bye, Peter Korsgaard
