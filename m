From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 23:23:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build on powerpc64
 with no __int128
In-Reply-To: <20191226220920.261056-1-fontaine.fabrice@gmail.com>
References: <20191226220920.261056-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226232341.014679b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 23:09:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/cb69d82ad1d41f6ea13d289ec2226d9bd5b67984
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...6-Address-platforms-with-no-__int128.patch | 28 +++++++++++++
>  ...y-to-help-platforms-with-no-__int128.patch | 42 +++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 package/libffi/0006-Address-platforms-with-no-__int128.patch
>  create mode 100644 package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch

I wonder how many fixes will be needed to make libffi build on PowerPC! :-)

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
