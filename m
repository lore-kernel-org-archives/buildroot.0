From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:50:15 +0200
Subject: [Buildroot] [PATCH] readline: use normal/default install target
In-Reply-To: <1376314666-26777-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376314666-26777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130813115015.1a805c33@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 12 Aug 2013 10:37:46 -0300, Gustavo Zacarias wrote:
> Since the custom INSTALL_TARGET doesn't consider static builds it breaks
> horribly and there's no need with the current version since it works
> just fine with a little varnish to remove samples. Fixes:
> http://autobuild.buildroot.net/results/5a6/5a62c38ec621d49230d76981db6024035e88804a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/readline/readline.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
