From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 21:51:41 +0100
Subject: [Buildroot] [PATCH] package/syslogd: workaround a compiler bug
 with CS powerpc 2012.03
In-Reply-To: <1455447313-14334-1-git-send-email-romain.naour@gmail.com>
References: <1455447313-14334-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160214215141.77b929be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 14 Feb 2016 11:55:13 +0100, Romain Naour wrote:
> The O3 optimization triggers a compiler bug with this toolchain,
> change it with 02.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2fb/2fb94ecfdc32761a09da35e6fcbdd512847ec911
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/sysklogd/sysklogd.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

I'm not a big fan of such quirks, but sometimes we don't really have
the choice. So: applied!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
