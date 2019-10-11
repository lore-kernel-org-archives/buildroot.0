From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Oct 2019 09:47:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: new package
In-Reply-To: <20190929153603.25695-1-bernd.kuhls@t-online.de>
References: <20190929153603.25695-1-bernd.kuhls@t-online.de>
Message-ID: <20191011094731.0bf9d777@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 17:36:03 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for subversion 1.12.x:
> https://github.com/apache/subversion/commit/472355d1597d7c1c64f20f72ed391fd34c0a8fb0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/utf8proc/Config.in     |  6 ++++++
>  package/utf8proc/utf8proc.hash |  3 +++
>  package/utf8proc/utf8proc.mk   | 14 ++++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/utf8proc/Config.in
>  create mode 100644 package/utf8proc/utf8proc.hash
>  create mode 100644 package/utf8proc/utf8proc.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
