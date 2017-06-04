From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 04 Jun 2017 10:16:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/exiv2: fix gettext detection,
	part II
References: <20170604080457.7593-1-bernd.kuhls@t-online.de>
 <20170604080457.7593-2-bernd.kuhls@t-online.de>
Message-ID: <28sc0ex4pp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 04 Jun 2017 10:04:57 +0200 schrieb Bernd Kuhls:

> It seems getting the gettext stuff right on all platforms is not that
> easy, this patch bumps exiv2 to include all gettext (and pthreads)
> patches currently applied upstream and adds the latest try to hopefully
> get things right.

Hi,

please wait with committing this patch, I am in discussion with upstream 
about the best solution, marked as Defered in patchworks.

Regards, Bernd
