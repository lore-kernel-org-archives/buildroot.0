From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 16:00:47 +0200
Subject: [Buildroot] [PATCH] package/samba4: security bump to version
 4.9.6
In-Reply-To: <20190408104952.19872-1-peter@korsgaard.com>
References: <20190408104952.19872-1-peter@korsgaard.com>
Message-ID: <20190410160047.61c1af61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 12:49:52 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerabilities:
> 
>  - CVE-2019-3870:
>    During the provision of a new Active Directory DC, some files in the private/
>    directory are created world-writable.
>    https://www.samba.org/samba/security/CVE-2019-3870.html
> 
>  - CVE-2019-3880:
>    Authenticated users with write permission can trigger a symlink traversal to
>    write or detect files outside the Samba share.
>    https://www.samba.org/samba/security/CVE-2019-3880.html
> 
> For more details, see the release notes:
> https://www.samba.org/samba/history/samba-4.9.6.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
