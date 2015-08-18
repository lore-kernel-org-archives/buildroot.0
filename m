From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:00:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpfm4: disable Werror
In-Reply-To: <1439496998-6386-1-git-send-email-joerg.krause@embedded.rocks>
References: <1439496998-6386-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150818110006.72b8d1c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 13 Aug 2015 22:16:38 +0200, J?rg Krause wrote:
> Set `DBG` to an empty value to disable -Werror when building libpfm4. Build
> aborts with a musl toolchain because of warnings about redirecting incorrect
> header includes.
> 
> So -Werror shouldn't be used in released code since it can cause random build
> failures on moderate warnings. It also depends on the used toolchain since
> different toolchains may or may not print the same warnings.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6df/6df9b94a79be1dc5ba878f7b67bf9ad4ce2f2e98/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libpfm4/libpfm4.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
