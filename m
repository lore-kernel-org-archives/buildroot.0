From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:26:42 +0200
Subject: [Buildroot] [PATCH 02/47] package/libplatform: new package
In-Reply-To: <1437597069-6448-3-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730152642.13f9b7e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Jul 2015 22:30:24 +0200, Bernd Kuhls wrote:
> Needed by libcec 3.x
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                  |    1 +
>  package/libplatform/Config.in      |    6 ++++++
>  package/libplatform/libplatform.mk |   16 ++++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/libplatform/Config.in
>  create mode 100644 package/libplatform/libplatform.mk

Applied with some changes:

    [Thomas:
      - adjust licensing information: license is not GPLv3+, but GPLv2+
        plus one source file in PHP license v3.01.
      - add proper license files.
      - remove the -DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi since
        it doesn't seem to be necessary
      - add patch to fix invalid header and library paths in
        platform-config.cmake.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
