From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:51:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: enable back static
 build
In-Reply-To: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
References: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
Message-ID: <20190417085122.71ddb512@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 16 Apr 2019 11:41:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-FindGLIB2.cmake-fix-static-build.patch | 39 +++++++++++++++++
>  ...ts.txt-disable-rpath-in-static-build.patch | 42 +++++++++++++++++++
>  package/wireshark/Config.in                   | 11 +++--
>  package/wireshark/wireshark.mk                | 14 ++++++-
>  4 files changed, 98 insertions(+), 8 deletions(-)
>  create mode 100644 package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
>  create mode 100644 package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch

Following the question from Arnout and your feedback, I have updated
the .mk file with a comment to explain why ENABLE_STATIC=OFF is the
right thing even for BR2_SHARED_STATIC_LIBS=y. And of course, I've
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
