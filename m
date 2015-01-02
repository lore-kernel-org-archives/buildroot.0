From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 11:21:16 +0100
Subject: [Buildroot] [PATCH 2/2] graph-depends: add an option
 --stop-on-virtual
In-Reply-To: <1420188573-4236-2-git-send-email-francois.perrad@gadz.org>
References: <1420188573-4236-1-git-send-email-francois.perrad@gadz.org>
 <1420188573-4236-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150102112116.7c2085eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri,  2 Jan 2015 09:49:33 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  docs/manual/common-usage.txt  |  3 +++
>  support/scripts/graph-depends | 11 +++++++++++
>  2 files changed, 14 insertions(+)

Why would we want to stop on virtual packages? I don't really see the
use case for this additional option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
