From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 10:13:02 +0200
Subject: [Buildroot] [PATCH] kvazaar: fix build with gcc 7
In-Reply-To: <f1fb85ca071785d204c738456570057f70e40add.1499969708.git.baruch@tkos.co.il>
References: <f1fb85ca071785d204c738456570057f70e40add.1499969708.git.baruch@tkos.co.il>
Message-ID: <20170715101302.51f96f25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 21:15:08 +0300, Baruch Siach wrote:
> Add upstream fix for a gcc 7 -Werror build failure.
> 
> Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...use-FILL_ARRAY-macro-to-prevent-warning-o.patch | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/kvazaar/0001-Modify-and-use-FILL_ARRAY-macro-to-prevent-warning-o.patch

Applied to master, after adding the references to the autobuilder
failures that you provided. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
