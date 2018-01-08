From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 20:59:30 +0100
Subject: [Buildroot] [PATCH 1/1] tcf-agent: disable package for powerpc64
In-Reply-To: <20180108134045.12578-1-nolange79@gmail.com>
References: <20180108134045.12578-1-nolange79@gmail.com>
Message-ID: <20180108205930.23c72cb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Jan 2018 14:40:45 +0100, Norbert Lange wrote:
> Fails to build, disable powerpc64 until upstream fixed it
> 
> Fixes:
>   http://autobuild.buildroot.net/results/5088f6efd44ce9b081c2c7825a7005a9cb60799d
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/tcf-agent/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
