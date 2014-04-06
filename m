From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 11:52:43 +0200
Subject: [Buildroot] [PATCH] libuci: fix Lua finding
In-Reply-To: <1396719988-2275-1-git-send-email-yegorslists@googlemail.com>
References: <1396719988-2275-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140406115243.59d13292@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sat,  5 Apr 2014 19:46:28 +0200, Yegor Yefremov wrote:
> This patch fixes Lua path comparison, if Lua is not provided.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/libuci/libuci-01-uci-fix-Lua-finding.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/libuci/libuci-01-uci-fix-Lua-finding.patch

Applied, thanks. I've added the autobuilder link, it would be good to
do it next time, as it's very useful when looking at a commit, to get a
reference to the build failure it is fixing. As an added bonus, it
ensures that you are counted as the contributors fixing autobuilder
failures that are thanked in the Buildroot release e-mail from
Peter! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
