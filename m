From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 11:54:44 +0200
Subject: [Buildroot] [PATCH 19/38] olsr: systemd support
In-Reply-To: <ac31cdd39a0dbb6b172575dc356a93e81389e080.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <ac31cdd39a0dbb6b172575dc356a93e81389e080.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714115444.3326834b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:06:09 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/olsr/olsr.mk      |  8 ++++++++
>  package/olsr/olsr.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/olsr/olsr.service

Applied after changing to use a relative path for the symbolic
link. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
