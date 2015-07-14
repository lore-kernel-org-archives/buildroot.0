From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 15:53:52 +0200
Subject: [Buildroot] [PATCH 25/38] rpi-userland: systemd support
In-Reply-To: <be47e4f10ee527a05bf4ac9831ef3db640d9d257.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <be47e4f10ee527a05bf4ac9831ef3db640d9d257.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714155352.1f4e729f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:07:07 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/rpi-userland/rpi-userland.mk | 7 +++++++
>  package/rpi-userland/vcfiled.service | 8 ++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/rpi-userland/vcfiled.service

Applied after fixing the patch to use a relative path for the symbolic
link, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
