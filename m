From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:19:22 +0100
Subject: [Buildroot] [PATCH v2 1/2] remove menu comment about deprecated
 modules
In-Reply-To: <1486549595-15691-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1486549595-15691-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1486549595-15691-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20170209221922.59206647@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 11:26:34 +0100, Zoltan Gyarmati wrote:
> As now the Qt version is configurable to simplify the menu display
> logic we remove the menu comment about deprecated modules and
> indicate it in the relevant modules' help text instead, and also
> mention in the help text if a package's tech preview status has been
> changed between Qt 5.6 and Qt 5.8
> 
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/qt5/Config.in                   | 7 +++----
>  package/qt5/qt53d/Config.in             | 4 ++++
>  package/qt5/qt5enginio/Config.in        | 3 +++
>  package/qt5/qt5quickcontrols2/Config.in | 3 +++
>  package/qt5/qt5serialbus/Config.in      | 3 +++
>  5 files changed, 16 insertions(+), 4 deletions(-)

Applied to master after fixing the commit title: it was missing a
"package/qt5" prefix.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
