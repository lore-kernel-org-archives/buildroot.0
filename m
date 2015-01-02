From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:48:27 +0100
Subject: [Buildroot] [PATCH 06/10] package/libxmlrpc: fix shared
 libraries build for uClibc
In-Reply-To: <1419717508-11627-7-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150102124827.1126f962@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 22:58:24 +0100, Romain Naour wrote:
> libxmlrpc is able to build shared libraries only for (e)glibc system
> since the regexp in config.mk.in is based on "linux-gnu".
> 
> Change this regexp to match "linux-uclibc".
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ....in-fix-shared-libraries-build-for-uClibc.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch

Thanks, applied. Please submit the patch to the upstream libxmlrpc
project.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
