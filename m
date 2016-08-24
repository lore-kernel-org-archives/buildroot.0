From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 18:57:45 +0200
Subject: [Buildroot] [PATCH next 1/2] libnetfilter_acct: remove
 autoreconf
In-Reply-To: <36a051f83d3380121beda455824b9f7564d075de.1472047140.git.baruch@tkos.co.il>
References: <36a051f83d3380121beda455824b9f7564d075de.1472047140.git.baruch@tkos.co.il>
Message-ID: <20160824185745.1c60c509@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 16:58:59 +0300, Baruch Siach wrote:
> Since commit b8d446cd56dc (libnetfilter_acct: bump to version 1.0.3,
> 2016-08-23) we no longer patch configure.ac.
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libnetfilter_acct/libnetfilter_acct.mk | 1 -
>  1 file changed, 1 deletion(-)

Both patches applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
