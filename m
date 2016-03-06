From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 12:11:48 +0100
Subject: [Buildroot] [PATCH] package/multicat: add missing dependency on
 bitstream
In-Reply-To: <1457210451-7436-1-git-send-email-romain.naour@gmail.com>
References: <1457210451-7436-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160306121148.257f25c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  5 Mar 2016 21:40:51 +0100, Romain Naour wrote:
> Multicat select bitstream package without adding it as build dependencies.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/multicat/multicat.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
