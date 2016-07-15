From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:52:24 +0200
Subject: [Buildroot] [PATCH] package/libgpg-error: disable tests
In-Reply-To: <1468586606-31578-1-git-send-email-yann.morin.1998@free.fr>
References: <1468586606-31578-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160715145224.22296333@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 14:43:26 +0200, Yann E. MORIN wrote:
> Tests are not usefull on an embedded device.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libgpg-error/libgpg-error.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
