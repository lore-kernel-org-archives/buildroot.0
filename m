From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:02:11 +0100
Subject: [Buildroot] [PATCHv2 1/4] toolchain-external: split target
 installation from staging installation
In-Reply-To: <1417470100-32657-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150110180211.7ee7164a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Dec 2014 22:41:37 +0100, Thomas Petazzoni wrote:
> Currently, all the installation work of the toolchain-external package
> is done during the install-staging step. However, in order to be able
> to properly collect the size added by each package to the target
> filesystem, we need to make sure that toolchain-external installs its
> files to $(TARGET_DIR) during the install-target step.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 36 +++++++++++++++++-----
>  1 file changed, 29 insertions(+), 7 deletions(-)

Since this has been tested by J?r?me, I applied it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
