From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Jun 2017 12:26:52 +0200
Subject: [Buildroot] [PATCH] vdr: bump version to 2.3.6
References: <20170605100525.44776-1-Vincent.Riera@imgtec.com>
Message-ID: <c8of0exv9f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 05 Jun 2017 11:05:25 +0100 schrieb Vicente Olivert Riera:

> -VDR_VERSION = 2.3.5
> +VDR_VERSION = 2.3.6

Hi,

did you build the release with uclibc? I got errors because of the new 
debugging code which uses execinfo.h.

Regards, Bernd
