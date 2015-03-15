From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:55:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: new package
In-Reply-To: <1425816084-5764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425816084-5764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150315185557.7c3fe531@free-electrons.com>
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

Applied with a few changes:

    [Thomas:
      - bump to 1.6.0
      - change the license to "Public Domain or MIT"
      - wrap Config.in help text]

Thanks!    

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
