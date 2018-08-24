From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:07:59 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/samba4: security bump to
 version 4.8.4
In-Reply-To: <20180824162744.11726-1-bernd.kuhls@t-online.de>
References: <20180824162744.11726-1-bernd.kuhls@t-online.de>
Message-ID: <20180824230759.097c0e18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 18:27:43 +0200, Bernd Kuhls wrote:
> Release notes: https://www.samba.org/samba/history/samba-4.8.4.html
> 
> Fixes
> 
> o  CVE-2018-1139  (Weak authentication protocol allowed.)
> o  CVE-2018-1140  (Denial of Service Attack on DNS and LDAP server.)
> o  CVE-2018-10858 (Insufficient input validation on client directory
>                    listing in libsmbclient.)
> o  CVE-2018-10918 (Denial of Service Attack on AD DC DRSUAPI server.)
> o  CVE-2018-10919 (Confidential attribute disclosure from the AD LDAP
>                    server.)
> 
> Cherry-picked from master branch:
> https://git.buildroot.net/buildroot/commit/?id=3d7ce0124aa6ab116f430604db72c99bcd7a299a
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied both to next (actually for the first patch, I did the
cherry-pick myself). However, I also cherry-picked
6d3723147659542ec1cba4139981d75413d89edc from master into next,
otherwise we would be having the same build failures on next that
6d3723147659542ec1cba4139981d75413d89edc was fixing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
