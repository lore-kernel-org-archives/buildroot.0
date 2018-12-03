From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:08:59 +0100
Subject: [Buildroot] [PATCH] package/ejabberd: Add a comment for runtime
 dependencies
In-Reply-To: <20181203152239.3490-1-johan.oudinet@gmail.com>
References: <20181203152239.3490-1-johan.oudinet@gmail.com>
Message-ID: <20181203220859.1919b861@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 16:22:39 +0100, Johan Oudinet wrote:
> Both p1_oauth2 and jiffy are runtime dependencies. Mark the
> corresponding select in the Config.in file with a # runtime
> comment.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/ejabberd/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
