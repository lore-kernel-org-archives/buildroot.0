From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:04:41 +0100
Subject: [Buildroot] [PATCH] python-webpy: depend on Python 2.x only
In-Reply-To: <1417729017-6395-1-git-send-email-yegorslists@googlemail.com>
References: <1417729017-6395-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141207220441.1966c272@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu,  4 Dec 2014 22:36:57 +0100, Yegor Yefremov wrote:
> webpy is still not ported to Python 3, so enable only
> for Python 2.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-webpy/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. I've added a reference to the corresponding
autobuilder failure. Please try to include such references in future
patches. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
