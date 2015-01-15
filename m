From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:38:44 +0100
Subject: [Buildroot] [PATCH] xorriso: needs threads and mmu
In-Reply-To: <1421283537-30600-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421283537-30600-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150115093844.07ce73d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 21:58:57 -0300, Gustavo Zacarias wrote:
> Fixes (threads):
> http://autobuild.buildroot.net/results/c2f/c2fb1cd4e9fe022e152bf6db7d5d819b08d673cd/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/xorriso/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
