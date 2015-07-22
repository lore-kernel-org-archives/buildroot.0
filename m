From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:23:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/qpid-proton: disable for static
 build only
In-Reply-To: <1437574390-31175-1-git-send-email-romain.naour@openwide.fr>
References: <1437574390-31175-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150722172321.31314591@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 22 Jul 2015 16:13:09 +0200, Romain Naour wrote:
> qpid-proton always build a shared library "libqpid-proton.so"
> 
> Fixes:
> http://autobuild.buildroot.net/results/bf6/bf6b9bcc0cead87c8fb12ec4c7f5ff73e6d61d3f/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/qpid-proton/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
