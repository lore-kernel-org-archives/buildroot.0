From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 22:12:05 +0200
Subject: [Buildroot] [autobuild v2 1/3] autobuild-run: prevent
 send_result from failing when gathering config files
In-Reply-To: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
References: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150504221205.20ad5154@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 29 Apr 2015 22:10:15 +0200, Samuel Martin wrote:
> os.makedirs() can fail if the directory already exists, so only create it
> when needed.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2
> - remove useless abspath call
> ---
>  scripts/autobuild-run | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
