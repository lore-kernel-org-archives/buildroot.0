From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 08:53:48 +0200
Subject: [Buildroot] [PATCH] php: fix WDDX extension build failure
In-Reply-To: <1338651160-22871-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 2 Jun 2012 12:32:40 -0300")
References: <1338651160-22871-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vg2fdvn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix WDDX extension build failure.  The documentation and
 Gustavo> source are conflicting about this, in theory libexpat support
 Gustavo> is deprecated and libxml2 can replace it, but it seems not so
 Gustavo> for WDDX, so pull in expat for it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
