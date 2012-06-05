From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 16:36:40 +0200
Subject: [Buildroot] [PATCH] collectd: fix dependencies for bind plugin
In-Reply-To: <1338647833-26267-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 2 Jun 2012 11:37:13 -0300")
References: <1338647833-26267-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ehptq0zr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The bind plugin requires libcurl and libxml2.
 Gustavo> These are properly selected but never added to COLLECTD_DEPENDENCIES.
 Gustavo> Fix that.

Committed, thanks.

-- 
Bye, Peter Korsgaard
