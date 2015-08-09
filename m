From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Aug 2015 12:55:26 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
	postgresql
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
 <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150411120739.GF4221@free.fr>
 <20150411141520.4060c6a3@free-electrons.com>
 <20150411122323.GG4221@free.fr>
Message-ID: <u5oj9cx6jd.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 11 Apr 2015 14:23:23 +0200 schrieb Yann E. MORIN:

> So, I can have a deeper and longer look, but that will be later. Unless
> Bernd beats me to it, that is. ;-)

Hi Yann,

this is not necessary anymore because the pgsql-rsyslog problem was fixed 
with this commit on May 14th by Baruch:

http://git.buildroot.net/buildroot/commit/package/postgresql?
id=3d3f70b567718ae308b5704ddd7d107c4849309e

I marked my patch as superseded.

Regards, Bernd
