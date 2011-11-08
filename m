From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Nov 2011 00:05:10 +0100
Subject: [Buildroot] [PATCH 6/6] lzma: remove deprecated
In-Reply-To: <1318343912-5480-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Oct 2011 11:38:32 -0300")
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
 <1318343912-5480-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehxiusex.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 Gustavo> ---
 Gustavo>  package/Config.in         |    1 -
 Gustavo>  package/lzma/Config.in    |   12 ------------
 Gustavo>  package/lzma/lzma.mk      |   16 ----------------
 Gustavo>  package/lzma/lzmacheck.sh |    9 ---------

It still seems to be used by fs/ and linux/ and dependencies check.
-- 
Bye, Peter Korsgaard
