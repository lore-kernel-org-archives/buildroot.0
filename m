From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:55:23 +0200
Subject: [Buildroot] [PATCH next 1/1] package/libpfm4: bump to version
 4.6.0
In-Reply-To: <1439497348-7543-1-git-send-email-joerg.krause@embedded.rocks>
References: <1439497348-7543-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150818145523.4846caf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 13 Aug 2015 22:22:28 +0200, J?rg Krause wrote:
> Also use checksum from sourceforge.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libpfm4/libpfm4.hash | 5 +++--
>  package/libpfm4/libpfm4.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
> index bc0ce52..30e65a5 100644
> --- a/package/libpfm4/libpfm4.hash
> +++ b/package/libpfm4/libpfm4.hash
> @@ -1,2 +1,3 @@
> -# Locally computed:
> -sha256  a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b  libpfm-4.3.0.tar.gz

Actually, even with the SourceForge hashes, we also want to keep a
strong hash such as sha256, so I've re-added a sha256 hash in
additionto the SourceForge provided hashes.

Applied to next with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
