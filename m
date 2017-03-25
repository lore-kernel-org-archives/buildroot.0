From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:56:58 +0100
Subject: [Buildroot] [PATCH] openvpn: bump version to 2.4.1
In-Reply-To: <20170323173750.24070-1-Vincent.Riera@imgtec.com>
References: <20170323173750.24070-1-Vincent.Riera@imgtec.com>
Message-ID: <20170325145658.1b959319@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 17:37:50 +0000, Vicente Olivert Riera wrote:
> --disable-eurephia configure option doesn't exist, so remove it.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
