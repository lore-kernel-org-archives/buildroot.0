From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:32:40 +0100
Subject: [Buildroot] [PATCH] package/efl: use liblz4 from lz4 package
In-Reply-To: <1480854125-27023-2-git-send-email-romain.naour@gmail.com>
References: <1480854125-27023-1-git-send-email-romain.naour@gmail.com>
 <1480854125-27023-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204153240.7f160acc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 13:22:05 +0100, Romain Naour wrote:
> Efl libraries bundle a copy of liblz4 which is also provided by
> lz4 Buildroot package. Switch to liblz4 from lz4 package.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 1 +
>  package/efl/efl.mk    | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
