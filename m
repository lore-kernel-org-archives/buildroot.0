From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:41:45 +0100
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.29
In-Reply-To: <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
References: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
 <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
Message-ID: <20170310214145.5477d6d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 10:54:44 +0200, Baruch Siach wrote:
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libnl/libnl.hash | 4 ++--
>  package/libnl/libnl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

As discussed, I have reverted this commit, which causes too many
autobuilder issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
