From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 16:26:53 +0200
Subject: [Buildroot] [PATCH v2 1/3] Remove --{enable,
 disable}-debug configure flags.
In-Reply-To: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
References: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150605162653.3dd451ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Thu, 12 Mar 2015 16:12:25 +0100, Johan Oudinet wrote:
> Adding this flag when BR2_ENABLE_DEBUG is activated make several
> packages to produce binaries that do not work as expected (e.g., dhcp,
> lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
> say it is adding this flag. It is supposed to build packages with
> debugging symbols enabled. So, let it do that only.
> 
> * package/Makefile.in: Do not add --{enable,disable}-debug flags.
> * package/pkg-autotools.mk: Remove ENABLE_DEBUG as it is not set
>   anymore.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
> Changes v1 -> v2:
>   - Do not pass --disable-debug neither.
> ---
>  package/Makefile.in      | 6 ------
>  package/pkg-autotools.mk | 1 -
>  2 files changed, 7 deletions(-)

Applied the three patches of this series, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
