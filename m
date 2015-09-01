From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2015 13:18:51 +0200
Subject: [Buildroot] [PATCH 1/2] harfbuzz: bump to version 1.0.2
In-Reply-To: <1441103176-26110-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 1 Sep 2015 07:26:15 -0300")
References: <1441103176-26110-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87io7uqtes.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Static fix patch upstream so dropped.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  .../0001-fix-static-linking-with-icu-uc.patch      | 33 ----------------------
 >  package/harfbuzz/harfbuzz.hash                     |  4 +--
 >  package/harfbuzz/harfbuzz.mk                       |  2 +-

From the looks of it we can now remove AUTORECONF = YES as we're no
longer patching Makefile.am and ltmain.sh is from libtool 2.4.2.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
