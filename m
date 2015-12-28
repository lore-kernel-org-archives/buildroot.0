From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 17:52:43 +0100
Subject: [Buildroot] [PATCH] autofs: not available on static
In-Reply-To: <1451319496-17224-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451319496-17224-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151228175243.01996646@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 28 Dec 2015 13:18:16 -0300, Gustavo Zacarias wrote:
> Uses dlfcn & friends, fixes:
> http://autobuild.buildroot.net/results/2f2/2f2dcf8d2af961c0401a4b39f96cefe691a4479b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/autofs/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
