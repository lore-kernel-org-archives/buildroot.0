From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:57:46 +0200
Subject: [Buildroot] [PATCH] squid: explicitly disable openssl support
 when BR2_PACKAGE_OPENSSL != y
In-Reply-To: <1436198015-7934-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436198015-7934-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150706175746.2e880b97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 6 Jul 2015 17:53:35 +0200, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/squid/squid.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
