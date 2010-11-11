From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Nov 2010 10:09:43 +0100
Subject: [Buildroot] Buildroot creates broken jffs2 image
In-Reply-To: <AANLkTik6UkpFMZV1AR_yCAHiCa-LT8vaZXqcWx+EkzpX@mail.gmail.com>
References: <AANLkTi=zp_NcMLOBTK5v+Hc=ryLOwT5YuNg9TXrrtdu=@mail.gmail.com>
	<20101109184310.257314b0@surf>
	<AANLkTik6UkpFMZV1AR_yCAHiCa-LT8vaZXqcWx+EkzpX@mail.gmail.com>
Message-ID: <20101111100943.2e2c83a0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Nov 2010 18:29:25 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> So I cherry-picked these commits and rebuilt. Now the issue is gone!
> Sweet! But AFAICS, jffs2 is broken for 2010.08 users...

Ok, good to know. Thanks for digging into this.

Concerning 2010.08 users, we don't yet have a process for releasing
stabilized version of past Buildroot releases. Maybe this will come in
the future, if someone steps up to do the maintainance.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
