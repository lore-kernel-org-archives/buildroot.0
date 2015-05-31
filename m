From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:22:41 +0200
Subject: [Buildroot] [PATCH v2] libgcrypt: allow optimization
In-Reply-To: <1433036654-2258-1-git-send-email-danomimanchego123@gmail.com>
References: <1433036654-2258-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20150531102241.717bf31b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 30 May 2015 21:44:14 -0400, Danomi Manchego wrote:
> Drop the --disable-optimization option, which makes the libgcrypt configure
> remove buildroot's optimization setting passed in from CFLAGS.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
