From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:32:38 +0100
Subject: [Buildroot] [PATCH v2 1/3] util-linux: add more tool select
 options
In-Reply-To: <1436652601-2227-2-git-send-email-danomimanchego123@gmail.com>
References: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
 <1436652601-2227-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20151004183238.7ba31b81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sat, 11 Jul 2015 18:09:59 -0400, Danomi Manchego wrote:
> Add more options to Config.in to optionally select or deselect
> util-linux "line" and "tunelp" tools.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/util-linux/Config.in     |   11 +++++++++++
>  package/util-linux/util-linux.mk |    2 ++
>  2 files changed, 13 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
