From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 12:41:42 -0300
Subject: [Buildroot] [PATCH] openssl: disable apps for NOMMU
In-Reply-To: <873917sh5n.fsf@macbook.be.48ers.dk>
References: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
 <876263tz4u.fsf@macbook.be.48ers.dk> <5084501D.8080405@zacarias.com.ar>
 <873917sh5n.fsf@macbook.be.48ers.dk>
Message-ID: <50856936.8010507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/12 17:29, Peter Korsgaard wrote:

> Ok, but why only on !MMU and not when the user has just decided that
> they don't want /usr/bin/openssl (E.G. not enable
> BR2_PACKAGE_OPENSSL_BIN)? Why would we want to build (but not install)
> it when MMU?

No reason in particular, i was just fixing the bug without considering
tidying other things up.
It will save some glorious 2 seconds of build time when !BIN, but why not?
Regards.
