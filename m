From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 13:16:14 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
 postgresql
In-Reply-To: <u5oj9cx6jd.ln2@ID-313208.user.individual.net>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
 <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150411120739.GF4221@free.fr>
 <20150411141520.4060c6a3@free-electrons.com>
 <20150411122323.GG4221@free.fr>
 <u5oj9cx6jd.ln2@ID-313208.user.individual.net>
Message-ID: <20150809131614.2a9db0bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 09 Aug 2015 12:55:26 +0200, Bernd Kuhls wrote:

> this is not necessary anymore because the pgsql-rsyslog problem was fixed 
> with this commit on May 14th by Baruch:
> 
> http://git.buildroot.net/buildroot/commit/package/postgresql?
> id=3d3f70b567718ae308b5704ddd7d107c4849309e
> 
> I marked my patch as superseded.

Good. Thanks for following up on this patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
