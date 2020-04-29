From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:55:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: fix build on
 uclibc or musl
In-Reply-To: <20200428063417.350351-1-fontaine.fabrice@gmail.com>
References: <20200428063417.350351-1-fontaine.fabrice@gmail.com>
Message-ID: <20200429225528.4a4990c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 08:34:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/4beb96d43180813906578b42875a1c3d4a905ed7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ists.txt-fix-build-on-uclibc-or-musl.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
