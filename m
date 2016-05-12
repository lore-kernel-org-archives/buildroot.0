From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:26:56 +0200
Subject: [Buildroot] [PATCH 5/9] package/go: Fix powerpc64 config typo
In-Reply-To: <07463ddac4fb3a64b56a60b5915e53a115c989b5.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <07463ddac4fb3a64b56a60b5915e53a115c989b5.1463010771.git.geoff@infradead.org>
Message-ID: <20160512162656.470e3542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:47 +0000, Geoff Levand wrote:
> Fix typo in config powerpc64 depends.  Go language only supports 64 bit powerpc.
> 
> Also add BR2_powerpc64le to depends list.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go/Config.in.host | 2 +-
>  package/go/go.mk          | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
