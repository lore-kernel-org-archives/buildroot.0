From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 12:42:26 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
 postgresql
In-Reply-To: <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411124226.726fde30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 09:52:16 +0200, Bernd Kuhls wrote:
> Configure misses libm and libpthread when checking for postgresql.
> Patching configure.ac did not fix the problem so we patch configure directly,

Hum, why?

It seems a bit backward to remove AUTORECONF = YES to then add a patch
that modifies the configure script directly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
