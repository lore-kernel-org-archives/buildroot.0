From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Jul 2016 16:43:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/boost: boost-local needs
	NTPL	threads
References: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
Message-ID: <ng0l4dx0de.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Am Sat, 02 Jul 2016 16:32:29 +0200 schrieb Romain Naour:

> Since Boost 1.61.0 boost-local require a toolchain with NTPL threads
> support.

NAK, the Cortex m4 toolchain is broken, not boost:
http://lists.busybox.net/pipermail/buildroot/2016-June/163865.html

Regards, Bernd
