From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:55:58 +0200
Subject: [Buildroot] [PATCH] support/mkusers: allow comments in users
 tables
In-Reply-To: <1445097019-3217-1-git-send-email-yann.morin.1998@free.fr>
References: <1445097019-3217-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151018175558.62ec445b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 17 Oct 2015 17:50:19 +0200, Yann E. MORIN wrote:
> The format of the users table files is non trivial, so it is sometimes
> handy to add comments explaining the syntax (or simply the reason for
> the user) inline in the files.
> 
> Ignore empty lines and comment lines prefixed with '#' similar to shell
> or makedevs files.
> 
> Packages that defined no user (the vast majority) would cause an empty
> line to be present in the internal users table, hence the reason we
> skipped empty usernames. Now that we ignore empty lines, we no longer
> need to check for empty usernames.
> 
> Reported-by: Peter Korsgaard <jacmet@uclibc.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/mkusers | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
