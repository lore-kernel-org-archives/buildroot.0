From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 23:30:51 +0200
Subject: [Buildroot] [PATCH 00/18] package/mplayer: add optional
 dependencies
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150407233051.44d71f67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 19:11:16 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (18):
>   package/mplayer: needs host-pkgconf
>   package/mplayer: add optional giflib support
>   package/mplayer: add optional ncurses support
>   package/mplayer: add optional samba support
>   package/mplayer: add optional libbluray support
>   package/mplayer: add optional fontconfig support
>   package/mplayer: add optional libfribidi support
>   package/mplayer: add optional libass support
>   package/mplayer: add optional libenca support

Applied up to this point, after switching some of them to autodetection
instead of the extra libs thing.

>   package/mplayer: add optional lzo support
>   package/mplayer: add optional faad2 support
>   package/mplayer: add optional rtmpdump support
>   package/mplayer: add optional speex support
>   package/mplayer: add optional libiconv support
>   package/mplayer: disable optional libcdio support
>   package/mplayer: add optional bzip2 support
>   package/mplayer: add optional lame support
>   package/mplayer: add optional libmpeg2 support

I'll have a look at those ones later on.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
