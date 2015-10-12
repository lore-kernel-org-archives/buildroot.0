From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:59:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.7.5
In-Reply-To: <1444588847-4224-1-git-send-email-joerg.krause@embedded.rocks>
References: <1444588847-4224-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151012175958.5f09256d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 11 Oct 2015 20:40:47 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libuv/libuv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Note that we can now add hash files to packages sourced from github. We
discussed it as the latest Buildroot Developers Meeting, and we believe
that github is now producing reproducible tarballs. So we want to add
hashes, and see if we discover problems or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
