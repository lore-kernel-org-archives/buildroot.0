From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:15:42 +0100
Subject: [Buildroot] [PATCH] svgtiny: update source url
In-Reply-To: <1420018280-28316-1-git-send-email-fabio.porcedda@gmail.com>
References: <1420018280-28316-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20141231151542.556175ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 31 Dec 2014 10:31:20 +0100, Fabio Porcedda wrote:
> As source url use the git repository instead of the unavaiable svn
> repository.
> 
> This fix the following error:
> 
> svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
> svn: E670002: Unknown hostname 'svn.netsurf-browser.org'
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libsvgtiny/libsvgtiny.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied, after taking into account the comment from Baruch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
