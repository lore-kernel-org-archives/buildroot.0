From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 23:48:13 +0200
Subject: [Buildroot] [PATCH/RFC 02/27] package/tinyxml2: new package
In-Reply-To: <1427913380-14808-3-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150421234813.753b2a03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  1 Apr 2015 20:35:55 +0200, Bernd Kuhls wrote:
> Required for upcoming kodi-pvr-dvblink package:
> https://github.com/kodi-pvr/pvr.dvblink/blob/master/CMakeLists.txt#L11
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in            |    1 +
>  package/tinyxml2/Config.in   |   11 +++++++++++
>  package/tinyxml2/tinyxml2.mk |   13 +++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/tinyxml2/Config.in
>  create mode 100644 package/tinyxml2/tinyxml2.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
