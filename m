From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:53:08 +0100
Subject: [Buildroot] [PATCH v2 1/2] lighttpd: carry common keywords out
 to variables
In-Reply-To: <20170308204332.11313-1-philipp.skadorov@savoirfairelinux.com>
References: <20170308211124.50d94081@free-electrons.com>
 <20170308204332.11313-1-philipp.skadorov@savoirfairelinux.com>
Message-ID: <20170309215308.0e88efbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Mar 2017 15:43:31 -0500, Philipp Skadorov wrote:
> S50lighttpd contains repeating keywords that are worth carrying out as
> variables: pid file name, daemon name, config file name.
> 
> Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
> ---
>  package/lighttpd/S50lighttpd | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
