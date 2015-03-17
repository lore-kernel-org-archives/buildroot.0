From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:02:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: new package
In-Reply-To: <1425816084-5764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425816084-5764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150317230224.74ad6502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  8 Mar 2015 13:01:23 +0100, Bernd Kuhls wrote:
> Needed for upcoming Kodi pctv/filmon PVR packages:
> 
> https://github.com/kodi-pvr/pvr.pctv/blob/master/CMakeLists.txt#L11
> https://github.com/kodi-pvr/pvr.filmon/blob/master/CMakeLists.txt#L11
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This package is causing a few autobuilder failures:
http://autobuild.buildroot.org/?reason=jsoncpp-1.6.0. Could you have a
look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
