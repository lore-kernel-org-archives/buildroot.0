From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:46:28 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: don't isntall file in
 random location
In-Reply-To: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr>
References: <1488921388-9691-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170310224628.12501d85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Mar 2017 22:16:28 +0100, Yann E. MORIN wrote:
> Currently, rpi-userland installs files in $(@D)/../../bin/ which is
> entirely stupid, especially in cross-compilation.
> 
> Get rid of the dubious, broken, custom install command.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  ...toverlay-don-t-install-script-in-random-l.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch

Applied to master after fixing the typo in the commit title. Please
don't forget to submit upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
