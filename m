From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Nov 2014 12:26:01 +0100
Subject: [Buildroot] [PATCH] schifra: mark as broken
In-Reply-To: <1415530410-18824-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Nov 2014 11:53:30 +0100")
References: <1415530410-18824-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbmopqd2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > There are many build failures caused by schifra, due to upstream
 > changing the tarball without doing new releases. Since has been an
 > on-going problem for some time, and is now the #1 issue in the
 > autobuilders. So let's mark this package broken, until someone cares
 > enough to fix it, or until we remove it.

I've been discussing with schifra upstream and hope to have a fix very
soon, so I prefer to wait a bit and get it fixed instead.

They already put versioned binaries up on http://schifra.com/buildroot/
but I would prefer them to not do anything special for buildroot (that
they might forget to maintain in the future).

-- 
Bye, Peter Korsgaard
