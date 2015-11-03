From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:49:22 +0100
Subject: [Buildroot] [PATCH 1/1] irssi: add missing dependency on
 host-pkgconf
In-Reply-To: <1446579905-31668-1-git-send-email-rprebello@gmail.com>
References: <1446579905-31668-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151103204922.440b8e87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Tue,  3 Nov 2015 17:45:05 -0200, Rodrigo Rebello wrote:
> The irssi configure script uses pkg-config to detect the availability of
> libglib2 and openssl.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  package/irssi/irssi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
