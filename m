From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:44:43 +0200
Subject: [Buildroot] [PATCH 35/38] supervisor: systemd support
In-Reply-To: <90fc7e95622b1b99fc97114e32d84798004f5afa.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <90fc7e95622b1b99fc97114e32d84798004f5afa.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150713224443.4f4b8816@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:14:18 +0300, Alex Suykov wrote:
> Running supervisord under systemd sounds wrong, but it is possible
> and probably makes sense in some cases.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/supervisor/supervisor.mk       |  8 ++++++++
>  package/supervisor/supervisord.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/supervisor/supervisord.service

Applied after using a relative symbolic link rather than an absolute
one. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
