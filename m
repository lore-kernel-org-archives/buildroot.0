From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 14:52:59 +0100
Subject: [Buildroot] [PATCH 1/1] support/download: Aternative access
 methods to CVS
In-Reply-To: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
References: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
Message-ID: <20160115145259.0fbabb8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Mano,

On Fri, 15 Jan 2016 10:55:10 -0200, Joao Mano wrote:

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 1c25c4e..a5726d8 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -279,7 +279,8 @@ information is (assuming the package name is +libfoo+) :
>    ** +cvs+ for retrieving source code from a CVS repository.
>       Used by default when +LIBFOO_SITE+ begins with +cvs://+.
>       The downloaded source code is cached as with the +svn+ method.
> -     Only anonymous pserver mode is supported.
> +     Anonymous pserver mode is assumed otherwise explicitly defined
> +     on +LIBFOO_SITE+.

I think an example would be good (for both the anonymous pserver mode,
and the other mode).

Otherwise, it looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
