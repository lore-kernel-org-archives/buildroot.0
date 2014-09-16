From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2014 23:07:34 +0200
Subject: [Buildroot] [PATCH] sqlcipher: fix static linking
In-Reply-To: <1410897150-24431-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Sep 2014 16:52:30 -0300")
References: <1410897150-24431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx476zqh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It uses openssl which for buildroot mandates libz, but doesn't link
 > against it so it fails. Fixes:
 > http://autobuild.buildroot.net/results/514/5145617f7c3cece933c845da3c9836d80d062bb6/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
