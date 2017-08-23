From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:51:02 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/kodi: bump to version 17.4
In-Reply-To: <20170822201526.3285-1-bernd.kuhls@t-online.de>
References: <20170822201526.3285-1-bernd.kuhls@t-online.de>
Message-ID: <20170823155102.1843b9f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 22:15:24 +0200, Bernd Kuhls wrote:
> Removed patch 0003, applied upstream:
> https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
> 
> -DWITH_FFMPEG is needed due to commit
> https://github.com/xbmc/xbmc/commit/5ba6eb7cadc41d5eb86ef94e3661b833b62953ff

It is not clear to me what in this commit makes -DWITH_FFMPEG required.
Could you explain?

I have nothing against adding -DWITH_FFMPEG, it looks alright, but I'd
like to understand the relationship with this commit you're pointing at.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
