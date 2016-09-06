From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:54:52 +0200
Subject: [Buildroot] [PATCH] audit: add powerpc64 arch support
In-Reply-To: <1472592119-51029-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1472592119-51029-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160906215452.30be5299@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Aug 2016 16:21:59 -0500, Matt Weber wrote:
> From: Judd Meinders <judd.meinders@rockwellcollins.com>
> 
> Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/audit/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've applied to master. It would be good to check if powerpc64le is
also supported by audit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
