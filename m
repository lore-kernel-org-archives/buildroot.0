From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 14:42:41 +0200
Subject: [Buildroot] [PATCH] package/binutils: finalize the bump ARC
 tools to arc-2017.03-rc2
In-Reply-To: <20170514104956.4160-1-romain.naour@gmail.com>
References: <20170514104956.4160-1-romain.naour@gmail.com>
Message-ID: <20170514144241.4db65d0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 12:49:56 +0200, Romain Naour wrote:
> The commit bumping ARC tools to arc-2017.03-rc2 [1] forgot to
> update the ARC tools version in binutils.mk
> 
> [1] 043737282010f83e8ec20618a034131bc7e8cae1
> 
> Fixes:
> http://autobuild.buildroot.net/results/f9c/f9c40610209fc22ac8c0db6bd57bd3b11bbe6d9c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  package/binutils/binutils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
