From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 16:28:00 +0200
Subject: [Buildroot] [PATCH next] systemd: bump version to 230
In-Reply-To: <1464008187-15431-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464008187-15431-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523162800.5dc8b7a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 13:56:27 +0100, Vicente Olivert Riera wrote:
> We pass "--with-default-dnssec=no" to "configure" as it might create
> incompatibilities with a few DNS servers and networks.
> 
> Announcement URL:
> 
>   https://lists.freedesktop.org/archives/systemd-devel/2016-May/036583.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
