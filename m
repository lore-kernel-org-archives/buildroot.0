From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Jan 2016 22:35:54 +0200
Subject: [Buildroot] [PATCH 2/8] lttng-babeltrace: make available for
 all C libraries
In-Reply-To: <1453148701-10036-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160118203553.GG10304@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 18, 2016 at 09:24:55PM +0100, Thomas Petazzoni wrote:
> Due to posix_fallocate() being unavailable in uClibc 0.9.33, libunwind

lttng-babeltrace

> was marked as available only for uClibc snapshot in glibc. However:
[...]

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
