From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 22:58:26 +0200
Subject: [Buildroot] [PATCH] bind: fix build failure for static+openssl
In-Reply-To: <1367787251-725-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 5 May 2013 17:54:11 -0300")
References: <1367787251-725-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sj21kutp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bind just links to openssl libraries without checking it's
 Gustavo> dependencies.  This works when doing shared builds since the
 Gustavo> linker picks the deps up, but fails badly on static builds.
 Gustavo> So just define LIBS="-lz" when openssl is enabled. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/a9a166f932e0b6727ae8e470ce748418797875b9/

Committed, thanks.

-- 
Bye, Peter Korsgaard
