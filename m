From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:19:57 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: add optional dependency on
 elfutils
In-Reply-To: <20180821012920.91804-1-ek9852@gmail.com>
References: <20180821012920.91804-1-ek9852@gmail.com>
Message-ID: <20180821111957.7d38d39a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 18:29:20 -0700, Keith Mok wrote:
> systemd can use elfutils when available, so this commit adds the
> detection of this library.
> 
> Signed-off-by: Keith Mok <ek9852@gmail.com>
> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
