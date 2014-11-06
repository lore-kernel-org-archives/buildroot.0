From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:22:51 +0100
Subject: [Buildroot] [PATCH 2/7] package/uclibc: enable wordexp
In-Reply-To: <1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141106182251.1c12ea40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  6 Nov 2014 10:36:48 -0300, Gustavo Zacarias wrote:
> It's required by Debian ifupdown.
> +13 KB for ARM.

Does Debian ifupdown fails to build? If it does, then we'll have
zillions of build failures with all the prebuilt uClibc toolchains that
don't have wordexp enabled :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
