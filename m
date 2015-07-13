From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:41:38 +0200
Subject: [Buildroot] [PATCH 38/38] mysql: systemd support
In-Reply-To: <796ccf072e7328c9837e4aca449012b62238e8e8.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <796ccf072e7328c9837e4aca449012b62238e8e8.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150713224138.6bb854ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:15:18 +0300, Alex Suykov wrote:
> Service startup follows sysv initscript and includes db init.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/mysql/mysql.mk       |  8 ++++++++
>  package/mysql/mysqld.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/mysql/mysqld.service

Applied after changing the symlink to be relative rather than absolute.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
