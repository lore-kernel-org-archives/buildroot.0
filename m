From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 14:39:21 +0200
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.8
In-Reply-To: <151004584b68ecae441b439ec19b195afb2d6b8f.1535086574.git.baruch@tkos.co.il>
References: <151004584b68ecae441b439ec19b195afb2d6b8f.1535086574.git.baruch@tkos.co.il>
Message-ID: <20180824143921.5da3500e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 07:56:14 +0300, Baruch Siach wrote:
> Fixes CVE-2018-15473: user enumeration vulnerability due to not delaying
> bailout for an invalid authenticating user until after the packet
> containing the request has been fully parsed.
> 
> Some OpenSSH developers don't consider this a security issue:
> 
>   https://lists.mindrot.org/pipermail/openssh-unix-dev/2018-August/037138.html
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
