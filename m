From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 22:57:51 +0200
Subject: [Buildroot] [PATCH 1/1] packages/linux-pam: disable when using
 musl
In-Reply-To: <1440097134-32316-1-git-send-email-brendanheading@gmail.com>
References: <1440097134-32316-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150820225751.54aac226@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Thu, 20 Aug 2015 19:58:54 +0100, Brendan Heading wrote:
> Fixes: http://autobuild.buildroot.net/results/e33/e337d69420ad00b2cc4017d639a31803926f2353/
> 
> linux-pam needs some surgery to build under musl, so for the time being
> disable it until the issues are solved. Also disables dependent package
> python-pam, and dependent suboptions under openvmtools, rsh-redone and
> util-linux.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

You also need to update the comments to indicate that those packages
are only available for (e)glibc or uClibc. See other examples in the
tree.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
