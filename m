From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:43:35 +0100
Subject: [Buildroot] [PATCH] vlc: update opencv disabling flag
In-Reply-To: <1394196321-11562-1-git-send-email-s.martin49@gmail.com>
References: <1394196321-11562-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140307224335.767bf7b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri,  7 Mar 2014 13:45:21 +0100, Samuel Martin wrote:
> This patch completes the commit d7f13e500e5970577e7abd96a0e9254a1e8f643f
> turning --{with,without}- options in --{enable,disable}- options.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/a34/a34abdcc92a6b2cf976760d66adf6c7572743bb4/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/vlc/vlc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
