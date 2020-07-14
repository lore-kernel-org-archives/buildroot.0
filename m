From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/umtprd: fix build on musl
In-Reply-To: <20200623213803.1043515-1-fontaine.fabrice@gmail.com>
References: <20200623213803.1043515-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714234506.63a144e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jun 2020 23:38:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0b577a2f0582e38d33bd41a4d8e4cb7ec6eab52b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...uild-errors-warnings-on-some-systems.patch | 38 +++++++++
>  ...finition-build-error-on-some-systems.patch | 78 +++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 package/umtprd/0001-Fix-the-missing-definitions-build-errors-warnings-on-some-systems.patch
>  create mode 100644 package/umtprd/0002-Fix-the-pthread-missing-definition-build-error-on-some-systems.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
