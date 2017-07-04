From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:15:48 +0200
Subject: [Buildroot] [PATCH] utils/brmake: print the error code of the
 build
In-Reply-To: <20170704215315.19990-1-yann.morin.1998@free.fr>
References: <20170704215315.19990-1-yann.morin.1998@free.fr>
Message-ID: <20170705001548.62f53e64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 23:53:15 +0200, Yann E. MORIN wrote:
> Since the stdout and stderr streams are redirected, it is not
> immediately obvious when a build failed, even though brmake really exits
> with the same error code as make did.
> 
> When there is an error, print the exit code after the elapsed time.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  utils/brmake | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
