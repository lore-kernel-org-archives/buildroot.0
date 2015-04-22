From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:09:34 +0200
Subject: [Buildroot] [PATCH v2 00/11] IPv6 optional removal
In-Reply-To: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429447202-13722-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150422230934.37f76dd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 19 Apr 2015 09:39:51 -0300, Gustavo Zacarias wrote:

> Gustavo Zacarias (11):
>   toolchain-external: remove CS sh2 toolchains
>   package/uclibc: default to Y for IPv6
>   toolchain: make IPv6 mandatory for external toolchains
>   system: drop IPv6 depend for systemd
>   busybox: force ipv6 build
>   configs: drop redundant IPv6 option
>   docs/manual: remove references to IPv6
>   packages: remove non-IPv6 enabler patches
>   packages: remove non-IPv6 dependencies and tweaks
>   package infra: drop non-IPv6 support
>   toolchain: drop BR2_INET_IPV6

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
