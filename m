From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 18 Mar 2017 15:54:07 -0400 (EDT)
Subject: [Buildroot] [PATCH] qt5declarative: build and install examples
In-Reply-To: <20170318150418.4a89d35f@free-electrons.com>
References: <20170316225425.26277-1-gael.portay@savoirfairelinux.com>
 <20170318150418.4a89d35f@free-electrons.com>
Message-ID: <1981317263.10781.1489866847245.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.

----- Original Message -----
From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
To: "Ga?l PORTAY" <gael.portay@savoirfairelinux.com>
Cc: buildroot at buildroot.org
Sent: Saturday, March 18, 2017 10:04:18 AM
Subject: Re: [Buildroot] [PATCH] qt5declarative: build and install examples

Hello,

On Thu, 16 Mar 2017 18:54:25 -0400, Ga?l PORTAY wrote:
> This patch builds and installs Qt examples for declarative module.
> 
> It proceeds the same way as others Qt5 modules. Samples are installed
> under /usr/lib/qt/examples/qml directory (/usr/lib/qt/examples/quick for
> quick).
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5declarative/qt5declarative.mk | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
