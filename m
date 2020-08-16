From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 11:28:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/bandwidthd: fix build with gcc
 10
In-Reply-To: <20200816090132.516521-1-fontaine.fabrice@gmail.com>
References: <20200816090132.516521-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816112851.0b369d30@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Aug 2020 11:01:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6308c8ee38b6017215038d47c009b238113bd36f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-bandwidthd.h-fix-build-with-gcc-10.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/bandwidthd/0001-src-bandwidthd.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
