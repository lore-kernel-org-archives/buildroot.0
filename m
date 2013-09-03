From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 16:40:39 +0200
Subject: [Buildroot] [PATCH] libsecret: specify where libgcrypt lives
In-Reply-To: <1378214841-12006-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Sep 2013 10:27:21 -0300")
References: <1378214841-12006-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761ui6k9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When libgcrypt support is enabled the configure script will try to
 Gustavo> find libgcrypt-config in the PATH. If the host distribution has it then
 Gustavo> brokeness ensues. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/eca/eca10b8360354e7e51406f7ac942d343987bde5e/

Committed, thanks.

-- 
Bye, Peter Korsgaard
