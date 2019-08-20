From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Tue, 20 Aug 2019 10:30:10 +0200
Subject: [Buildroot] [PATCH] package/meson: support cmake exported
 packages
In-Reply-To: <20190820082400.13285-1-m.niestroj@grinn-global.com>
References: <20190820082400.13285-1-m.niestroj@grinn-global.com>
Message-ID: <87ftlwtf1p.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please ignore this mail. This patch was sent already few days ago, and
I've resent it now by mistake.

Marcin Niestroj <m.niestroj@grinn-global.com> writes:

> So far meson was not able to find CMake modules in cross compiled
> environments such as Buildroot. Added patch allows to do that
> now. Additionally meson needs to know path to cmake binary in order to
> finalize CMake module import.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  ...port-for-crosscompiled-CMake-modules.patch | 60 +++++++++++++++++++
>  package/meson/cross-compilation.conf.in       |  1 +
>  package/pkg-meson.mk                          |  1 +
>  3 files changed, 62 insertions(+)
>  create mode 100644 package/meson/0002-Improve-support-for-crosscompiled-CMake-modules.patch

-- 
Marcin Niestr?j
