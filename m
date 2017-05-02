From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:52:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rapidjson: switch to CMake
In-Reply-To: <20170420230532.21678-1-bernd.kuhls@t-online.de>
References: <20170420230532.21678-1-bernd.kuhls@t-online.de>
Message-ID: <20170502225244.3cc7a884@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 01:05:32 +0200, Bernd Kuhls wrote:
> Upcoming Kodi v18 depends on RapidJSON and detects it by using pkg-conf:
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindRapidJSON.cmake#L13
> 
> Currently our package installs only the header files, but RapidJSON.pc
> is also needed. Luckily this can be fixed by switching to CMake which
> does the job, also add configure options to disable the CMake build of
> executables.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: add configure options to disable build of example code, rapidjson
>     is a header-only package, fixes broken -march=native (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
