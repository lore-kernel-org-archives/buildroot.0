From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:57:35 +0100
Subject: [Buildroot] [PATCH] CHANGES: extend 2016.11-rc1 changelog
In-Reply-To: <20161103214929.22442-1-arnout@mind.be>
References: <20161103214929.22442-1-arnout@mind.be>
Message-ID: <20161103225735.5b27a6fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Nov 2016 22:49:29 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> - Longer explanation of multi-BR2_EXTERNAL
> - Mention nobody UID 99 -> 65534 change
> - Mention removal of BR2_DEPRECATED
> - Mention use of system cmake
> - Mention new dependency on ExtUtils::MakeMaker. The other perl
>   dependencies are not mentioned since they only apply if mpv is built.
> - Mention the $(STAGING_DIR)/$(O) check.
> - Mention unsafe path detection in -isystem etc.
> - Mention linux-tools split.
> - Mention changes in legal-info.
> - Mention that pseudo is used instead of fakeroot.
> - Correct the info of toolchainfile.cmake: it still sets cflags but it
>   doesn't force them anymore (doesn't append).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  CHANGES | 57 +++++++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 49 insertions(+), 8 deletions(-)

Applied to master, thanks a lot for the additional writeup!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
