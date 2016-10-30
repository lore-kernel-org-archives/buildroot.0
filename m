From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 16:42:25 +0100
Subject: [Buildroot] [PATCH 1/1] trinity: fix Config.in depends on logic
In-Reply-To: <1477831905-14615-1-git-send-email-nunes.erico@gmail.com>
References: <1477831905-14615-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161030164225.4beb99a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 13:51:45 +0100, Erico Nunes wrote:
> The comment from trinity Config.in currently does not show up in
> menuconfig for glibc or uClibc toolchains with older headers.
> This commit fixes the logic so that it shows up when either one of the
> dependencies from trinity are not met.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/trinity/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
