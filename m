From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 22:00:19 +0200
Subject: [Buildroot] [PATCH 1/2] libdrm: VC4 change dependency to arm OR
 aarch64
In-Reply-To: <20171011154211.2651-1-olivier.schonken@gmail.com>
References: <20171011154211.2651-1-olivier.schonken@gmail.com>
Message-ID: <20171011220019.16500560@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 17:42:10 +0200, Olivier Schonken wrote:
> Enable selection of VC4 driver when compiling for Rpi3 using aarch64
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/libdrm/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
