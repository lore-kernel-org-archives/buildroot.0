From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:57:12 +0200
Subject: [Buildroot] [PATCH v1] libdrm: update driver options
In-Reply-To: <1444160130-10549-1-git-send-email-ps.report@gmx.net>
References: <1444160130-10549-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151010125712.2455f2f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue,  6 Oct 2015 21:35:30 +0200, Peter Seiderer wrote:
> - add AMD GPU driver (available since 2.4.63)
> - freedreno is no longer experimental (since 2.4.59)
> - add NVIDIA Tegra driver (available since 2.4.59)
> - update help texts (install vs. installs, change to complete
>   sentences)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libdrm/Config.in | 27 +++++++++++++++++++--------
>  package/libdrm/libdrm.mk | 16 ++++++++++++++--
>  2 files changed, 33 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
