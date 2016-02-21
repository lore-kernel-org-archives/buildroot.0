From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 00:01:44 +0100
Subject: [Buildroot] [PATCH] package/multicat: Add package
In-Reply-To: <1453884011-15524-1-git-send-email-julian@jusst.de>
References: <1453884011-15524-1-git-send-email-julian@jusst.de>
Message-ID: <20160222000144.357a7c89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian Scheel,

On Wed, 27 Jan 2016 09:40:11 +0100, Julian Scheel wrote:
> multicat is a simple and efficient multicast and transport stream manipulation
> tool.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
>  package/Config.in              |  1 +
>  package/multicat/Config.in     | 11 +++++++++++
>  package/multicat/multicat.hash |  4 ++++
>  package/multicat/multicat.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/multicat/Config.in
>  create mode 100644 package/multicat/multicat.hash
>  create mode 100644 package/multicat/multicat.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
