From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:47:12 +0200
Subject: [Buildroot] [PATCH] lttng-tools: update to 2.9.5
In-Reply-To: <20170628131000.GA26783@waldemar-brodkorb.de>
References: <20170628131000.GA26783@waldemar-brodkorb.de>
Message-ID: <20170701194712.5fd38276@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 15:10:00 +0200, Waldemar Brodkorb wrote:
> Latest release fixed dlmopen detection, so that
> musl/uClibc-ng toolchains can be used.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/lttng-tools/Config.in        | 7 ++-----
>  package/lttng-tools/lttng-tools.hash | 6 +++---
>  package/lttng-tools/lttng-tools.mk   | 2 +-
>  3 files changed, 6 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
