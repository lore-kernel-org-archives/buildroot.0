From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 15:57:28 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable features and add
 optional dependencies
In-Reply-To: <20171218095143.15343-1-mlang@blind.guru>
References: <20171218095143.15343-1-mlang@blind.guru>
Message-ID: <20171218155728.7424cbd2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 10:51:43 +0100, Mario Lang wrote:
> * --without-midi-package should fix a number of autobuild failures.
> * Disable a number of speech drivers to avoid build failures
>   if they are installed on the host.
> * Optional dependency on espeak and flite fixes builds where
>   espeak or flite are installed on the host.
> 
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  package/brltty/brltty.mk | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Applied to master after adding the references to the autobuilder
failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
