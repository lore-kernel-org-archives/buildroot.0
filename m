From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:32:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: fix build on musl
In-Reply-To: <20210320174056.442784-1-fontaine.fabrice@gmail.com>
References: <20210320174056.442784-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320213202.510d9231@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 18:40:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build on musl with qpid-proton in version 0.33.0 which was added
> with commit d4c0fde91da0d79204a21ed8de1bd410efa1c4d6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6a901b9ff68b7f52cabf8273d1017025fbd93b0d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...r-epoll-internal.h-fix-build-on-musl.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/qpid-proton/0001-c-src-proactor-epoll-internal.h-fix-build-on-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
