From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 14:18:24 +0100
Subject: [Buildroot] [PATCH v1] meson: fix RPATH patch
In-Reply-To: <20190104193233.27527-1-ps.report@gmx.net>
References: <20190104193233.27527-1-ps.report@gmx.net>
Message-ID: <20190206141824.469c047b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Jan 2019 20:32:33 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The re-added ([1]) patch missed to remove two lines of the
> original unconditional code.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=5c939246a802c0ad9704dac1505105037542a1d3
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-RPATH-if-install_rpath-is-not-empty.patch | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
