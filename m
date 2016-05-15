From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:18:11 +0200
Subject: [Buildroot] [PATCH] sg3-utils: disable for blackfin
In-Reply-To: <1463237695-28471-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463237695-28471-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160515211811.2dd1f222@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 11:54:55 -0300, Gustavo Zacarias wrote:
> Suffers from the usual symbol prefixing problems for bfin, it's probably
> easy to fix, however no bfin has/will be used for storage apps since
> they lack the usual ports for it. Fixes:
> http://autobuild.buildroot.net/results/314/31447787e70cd351ce01b7a49ba029758d0c68e5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sg3_utils/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
