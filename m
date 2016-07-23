From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 17:03:19 +0200
Subject: [Buildroot] [PATCH] lighttpd: add clock_gettime patch
In-Reply-To: <1469285814-3197-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469285814-3197-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723170319.6816a256@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 11:56:54 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/590/5901153a345c69d0a041309cfb79329bb42ff98d/
> 
> Patch status: upstream.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...tobuild-clock_gettime-lrt-with-glibc-2.17.patch | 155 +++++++++++++++++++++
>  package/lighttpd/lighttpd.mk                       |   2 +
>  2 files changed, 157 insertions(+)
>  create mode 100644 package/lighttpd/0002-autobuild-clock_gettime-lrt-with-glibc-2.17.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
