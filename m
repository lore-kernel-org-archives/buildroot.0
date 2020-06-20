From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:55:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: drop dynamic
 library dependency
In-Reply-To: <20200620202934.1181500-1-fontaine.fabrice@gmail.com>
References: <20200620202934.1181500-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620225545.14162331@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 22:29:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...FindMahoMqttC.cmake-fix-static-build.patch | 35 +++++++++++++++++++
>  package/paho-mqtt-cpp/Config.in               |  6 ++--
>  package/paho-mqtt-cpp/paho-mqtt-cpp.mk        | 14 ++++++++
>  3 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
