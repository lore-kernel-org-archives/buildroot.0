From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 15:51:54 +0200
Subject: [Buildroot] [PATCH 34/38] triggerhappy: systemd support
In-Reply-To: <dc9d8d0b528d349289f87b54f476f736d25ea1b4.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <dc9d8d0b528d349289f87b54f476f736d25ea1b4.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714155154.42ce1db8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:14:07 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/triggerhappy/triggerhappy.mk      | 8 ++++++++
>  package/triggerhappy/triggerhappy.service | 9 +++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/triggerhappy/triggerhappy.service

Applied after fixing the patch to use a relative path for the symbolic
link, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
