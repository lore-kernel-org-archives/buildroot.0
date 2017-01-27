From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:52:49 +1300
Subject: [Buildroot] [PATCH 1/1] Fix gcrypt library linker option on
 collectd.
In-Reply-To: <1482988838-6777-1-git-send-email-jackzzjack@gmail.com>
References: <1482988838-6777-1-git-send-email-jackzzjack@gmail.com>
Message-ID: <20170127215249.49ef7a37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Dec 2016 13:20:38 +0800, Yu-Ting, Kao wrote:
> ---
>  package/collectd/collectd.mk | 1 +
>  1 file changed, 1 insertion(+)

What problem is this commit fixing? An autobuilder failure? If so,
there should be a reference to it. I don't see any collectd issue
reported by the autobuilders:
http://autobuild.buildroot.net/?reason=collectd-5.7.1. Maybe this issue
has already been fixed?

Also, the commit title should always have the format:

	<package>: <short description>

so in your case, it should be:

	collectd: ...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
