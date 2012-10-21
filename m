From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 22:29:24 +0200
Subject: [Buildroot] [PATCH] openssl: disable apps for NOMMU
In-Reply-To: <5084501D.8080405@zacarias.com.ar> (Gustavo Zacarias's message of
 "Sun, 21 Oct 2012 16:42:21 -0300")
References: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
 <876263tz4u.fsf@macbook.be.48ers.dk>
 <5084501D.8080405@zacarias.com.ar>
Message-ID: <873917sh5n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 10/21/12 16:15, Peter Korsgaard wrote:
 >> Why is this not BR2_PACKAGE_OPENSSL_BIN instead?

 Gustavo> Because the change must be done before anything is built.

Ok, but why only on !MMU and not when the user has just decided that
they don't want /usr/bin/openssl (E.G. not enable
BR2_PACKAGE_OPENSSL_BIN)? Why would we want to build (but not install)
it when MMU?

-- 
Bye, Peter Korsgaard
