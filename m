From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 09:00:24 +0200
Subject: [Buildroot] [PATCH 03/23] package: allow to override the make
	install target for host packages
In-Reply-To: <1372620553-11416-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:53 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc4sqgaf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In order to convert gcc to the package infrastructure, we need
 Thomas> a way of overriding the name of the make target used for the
 Thomas> installation of host packages, just like we have for target
 Thomas> packages.

Committed, thanks.

-- 
Bye, Peter Korsgaard
