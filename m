From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:56:22 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add tilde '~'
 expansion for pathes
In-Reply-To: <20200307103704.20524-1-heiko.thiery@gmail.com>
References: <20200307103704.20524-1-heiko.thiery@gmail.com>
Message-ID: <20200412145622.3dfeb4ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Mar 2020 11:37:05 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The script arguments 'nvd-path', 'json' and 'html' currently does not
> allow to have '~' in path for user home directory. With this patch
> this '~' is expanded to the real user home directory.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  support/scripts/pkg-stats | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied to master with an improved commit log to explain the difference
between --html=~/foo and --html ~/foo.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
