From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:18:16 +0200
Subject: [Buildroot] [PATCH 1/1] qpdf: Fix dependency on JPEG
In-Reply-To: <20171019085635.8726-1-olivier.schonken@gmail.com>
References: <20171019085635.8726-1-olivier.schonken@gmail.com>
Message-ID: <20171021101816.61fd827d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 10:56:35 +0200, Olivier Schonken wrote:
> Solves http://autobuild.buildroot.net/results/1abd0814de200abd6bad42675405a686cac4eb58
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/qpdf/Config.in | 1 +
>  package/qpdf/qpdf.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

I've removed the autobuilder reference, which is now broken (following
the hard disk crash), and replaced with an actual copy/paste of the
error being fixed. And applied.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
