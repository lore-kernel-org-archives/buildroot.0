From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:08:36 +0200
Subject: [Buildroot] [PATCH 2/4] boot/uboot: add hash file
In-Reply-To: <1429361566-3538-2-git-send-email-joerg.krause@embedded.rocks>
References: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
 <1429361566-3538-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150419100836.40d7c13c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 18 Apr 2015 14:52:44 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  boot/uboot/uboot.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 boot/uboot/uboot.hash

Applied, thanks.

Once the hashes become mandatory, we'll have to take care of this
package, since the user might download custom tarball / git version,
which will not match the hash provided in the hash file. Cc'ed Yann on
this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
