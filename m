From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 23:04:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/swupdate: add hash file
In-Reply-To: <1445287527-30196-1-git-send-email-joerg.krause@embedded.rocks>
References: <1445287527-30196-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151019230410.7dffafd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 19 Oct 2015 22:45:25 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/swupdate/swupdate.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/swupdate/swupdate.hash

All three patches applied. For the last patch, I just changed a bit to
use a single definition of <pkg>_PATCH.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
