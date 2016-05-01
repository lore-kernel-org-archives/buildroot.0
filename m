From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:36:51 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: install header files to staging
 directory
In-Reply-To: <1461916620-5170-2-git-send-email-joerg.krause@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
 <1461916620-5170-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501223651.00aed625@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 09:56:58 +0200, J?rg Krause wrote:
> These header files are required by swupdate.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mtd/mtd.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
