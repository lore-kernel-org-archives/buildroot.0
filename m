From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:36:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools.mk: set
 --localstatedir=/var by default
In-Reply-To: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
References: <1413585393-8349-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141019113651.4398f0f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 18 Oct 2014 00:36:32 +0200, J?rg Krause wrote:
> `localstatedir` is a common autoconf variable like prefix and sysconfdir. At 
> this time 25 autotools and one generic package uses this Makefile variable. 22 
> of the autotools packages use --localstatedir=/var, the remaining use custom 
> settings.
> 
> Setting `localstatedir` to /var is consistent with the Filesystem Hierarchy 
> Standard (FHS). So it's time to move it as a common definition in the 
> autotools infrastructure. 
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/pkg-autotools.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
