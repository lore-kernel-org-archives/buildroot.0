From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:53:29 +0100
Subject: [Buildroot] [PATCH] packages/pseudo: needs attr
In-Reply-To: <1478348806-11917-1-git-send-email-yann.morin.1998@free.fr>
References: <1478348806-11917-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161105135329.472ed6ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 13:26:46 +0100, Yann E. MORIN wrote:
> This fixes the build on machines that do not have attr development files
> installed.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pseudo/pseudo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
