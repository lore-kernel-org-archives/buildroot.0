From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 09 Oct 2013 15:47:59 +0200
Subject: [Buildroot] [PATCH v2] Fix compilation of busybox 1.21.1
In-Reply-To: <1381310110-7183-1-git-send-email-jezz@sysmic.org>
References: <1381310110-7183-1-git-send-email-jezz@sysmic.org>
Message-ID: <4032860.0r4xX98ikO@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 09 October 2013 11:15:09 J?r?me Pouiller wrote:
> It seems patches previously applied on busybox 1.20.2 are also needed
> for version 1.21.1.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  ...ersion_code-don-t-fail-on-Linux-version-s.patch |   46 ++++++++
>  ...correct-m_status-field-in-outgoing-packet.patch |   40 +++++++
>  .../1.21.1/busybox-1.21.1-pkg-config-selinux.patch |   67 +++++++++++
>  .../1.21.1/busybox-1.21.1-sys-resource.patch       |  123 ++++++++++++++++++++ 
>  4 files changed, 276 insertions(+)
>  create mode 100644 package/busybox/1.21.1/busybox-1.21.1-get_linux_version_code-don-t-fail-on-Linux-version-s.patch 
>  create mode 100644 package/busybox/1.21.1/busybox-1.21.1-ntpd-fix-incorrect-m_status-field-in-outgoing-packet.patch 
>  create mode 100644 package/busybox/1.21.1/busybox-1.21.1-pkg-config-selinux.patch 
>  create mode 100644 package/busybox/1.21.1/busybox-1.21.1-sys-resource.patch

Arg! Forget this patch. Problem was local to my workstation.

Sorry for disturbing,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
