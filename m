From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Aug 2020 18:39:37 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/waffle: bump version to 1.6.1
In-Reply-To: <20200803061027.664537-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 3 Aug 2020 08:10:27 +0200")
References: <20200803061027.664537-1-bernd.kuhls@t-online.de>
Message-ID: <87d047u1iu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes for v1.6.1:
 > https://lists.freedesktop.org/archives/mesa-announce/2020-March/000575.html

 > Removed patch 0001 which was applied upstream.

 > Switched _SITE to gitlab according to release notes for v1.6.0:
 > https://lists.freedesktop.org/archives/mesa-announce/2019-June/000520.html

 > Added -Dwaffle_has_nacl=OFF to CONF_OPTS to disable nacl support, this
 > avoids adding a dependency to C++:
 > https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61#9a2aa4db38d3115ed60da621e012c0efc0172aae_27_26

 > Added support for mesa3d surfaceless egl:
 > https://gitlab.freedesktop.org/mesa/waffle/commit/7318f22c4761035c03e99420edf3e92f07e06c9c

 > Added support for bash-completion:
 > https://gitlab.freedesktop.org/mesa/waffle/-/blob/maint-1.6/CMakeLists.txt#L189

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v3: added support for bash-completion (Romain)
 > v2: bump to v1.6.1
 >     disabled nacl support (Romain)
 >     added support for mesa3d surfaceless egl (Romain)


Committed, thanks.

-- 
Bye, Peter Korsgaard
