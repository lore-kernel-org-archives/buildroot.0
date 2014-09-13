From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 22:35:50 +0200
Subject: [Buildroot] [PATCH] tn5250: fix openssl dir
In-Reply-To: <1410349896-27706-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 10 Sep 2014 08:51:36 -0300")
References: <1410349896-27706-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oauj6yxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > If openssl devfiles are installed in the host the automatic lookup might
 > find that and cause issues.
 > So be explicit on the directory to avoid a search and patch the
 > directory logic since it's got a bug. Fixes:
 > http://autobuild.buildroot.net/results/5dd/5ddc8636d6555851f692c0c21f583df235340b19/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
