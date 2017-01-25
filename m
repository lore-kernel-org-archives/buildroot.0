From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:44:58 +1300
Subject: [Buildroot] [PATCH 1/2] package/libasplib: bump version
In-Reply-To: <20170101120244.13383-1-bernd.kuhls@t-online.de>
References: <20170101120244.13383-1-bernd.kuhls@t-online.de>
Message-ID: <20170125164458.5a4043e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jan 2017 13:02:43 +0100, Bernd Kuhls wrote:
> libasplib now contains modules, we enable only those for the moment
> which do not need external dependencies. We are not in a hurry to fully
> support all features of this package because the upcoming Kodi release
> 17.x-Krypton will not carry any ADSP add-ons:
> https://github.com/xbmc/repo-binary-addons/commit/db3b767309df25daae4f01f01dba85ca7b3464b0
> 
> -DASPLIB_MODULES_TO_BUILD=some looks hackish because the default is to
> enable all modules:
> https://github.com/AchimTuran/asplib/blob/master/CMakeLists.txt#L35
> 
> But -DASPLIB_MODULES_TO_BUILD=OFF does not disable the build of all
> modules as well because of
> https://github.com/AchimTuran/asplib/blob/master/asplib_modules/CMakeLists.txt#L19
> so I added "some" as fake value.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libasplib/libasplib.hash |  2 +-
>  package/libasplib/libasplib.mk   | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
