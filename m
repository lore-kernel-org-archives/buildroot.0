From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:42:33 +0200
Subject: [Buildroot] [PATCH 07/83 v2] package/libdrm: move tests
 programs to the bottom
In-Reply-To: <afb50121648ae0edbadfa0f702b2777b52cc28df.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <afb50121648ae0edbadfa0f702b2777b52cc28df.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704224233.0825515d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:18 +0200, Yann E. MORIN wrote:
> Tests programs are not that important; at least, they're probably less
> important than the drivers selection.
> 
> Move it down to after the drivers selection.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/libdrm/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
