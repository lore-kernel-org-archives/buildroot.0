From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:13:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python 3.8
In-Reply-To: <20191115194728.1165-1-fontaine.fabrice@gmail.com>
References: <20191115194728.1165-1-fontaine.fabrice@gmail.com>
Message-ID: <20191115211345.03f69663@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 20:47:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix build with sigrok-cli and python 3.8
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4855d42545cbfeeec7529410acc84b61bc8790af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...figure-ac-Add-support-for-Python-3-8.patch | 41 +++++++++++++++++++
>  package/libsigrokdecode/libsigrokdecode.mk    |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
