From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:34:01 +0200
Subject: [Buildroot] [PATCH] bind: bump version to bugfix release
 9.11.1-P3
In-Reply-To: <20170724091610.12852-1-peter@korsgaard.com>
References: <20170724091610.12852-1-peter@korsgaard.com>
Message-ID: <20170724183401.004b1c6f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 11:16:10 +0200, Peter Korsgaard wrote:
> BIND 9.11.1-P3 addresses a TSIG regression introduced in the 9.11.1-P2
> security bump:
> 
> https://lists.isc.org/pipermail/bind-announce/2017-July/001057.html
> 
> Also add a hash for the license file while we're at it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/bind/bind.hash | 5 +++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
