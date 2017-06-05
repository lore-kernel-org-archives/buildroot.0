From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 12:08:28 +0200
Subject: [Buildroot] [PATCH] gcc: allow gcc 7.1 for microblaze
 architecture
In-Reply-To: <20170601090236.GA23718@waldemar-brodkorb.de>
References: <20170601090236.GA23718@waldemar-brodkorb.de>
Message-ID: <20170605120828.66008a28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Jun 2017 11:02:36 +0200, Waldemar Brodkorb wrote:
> Add patch from gcc upstream master to fix an issue.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/7.1.0/0892-microblaze-Revert.patch | 40 ++++++++++++++++++++++++++
>  package/gcc/Config.in.host                     |  1 -
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 package/gcc/7.1.0/0892-microblaze-Revert.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
