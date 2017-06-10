From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 21:32:05 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2
	is	enabled
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <l2ut0exdeb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 18 Oct 2016 16:53:23 +0200 schrieb Johan Oudinet:

> Fix bug 9341: avahi-utils does not compile with uClibc and libglib2.

Hi,

please test this patch: http://patchwork.ozlabs.org/patch/774259/
It should not fail with glibc.

Regards, Bernd
