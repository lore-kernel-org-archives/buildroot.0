From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 May 2015 22:16:48 +0200
Subject: [Buildroot] [PATCH 1/1] autobuild-run: show options along with
 their defaults
In-Reply-To: <1430495931-20779-1-git-send-email-dywi@mailerd.de>
References: <1430495931-20779-1-git-send-email-dywi@mailerd.de>
Message-ID: <20150504221648.62f22498@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Fri,  1 May 2015 17:58:51 +0200, Andr? Erdmann wrote:
> Currently, the default values for options are printed at the end of the help
> message, so there is a visual distance between the "--<option>" help and its
> default value that increases with every newly introduced option.
> 
> Move them closer together by means of str-dict formatting, "%(key)s".
> 
> "[default: ]" cannot be used as it gets parsed by docopt,
> using "Defaults to ...", "Not set by default", ... phrases instead.
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
> ---
>  scripts/autobuild-run | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
