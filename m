From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 14:01:10 +0200
Subject: [Buildroot] [PATCH 14/38] mongoose: systemd support
In-Reply-To: <fa462132229bb0c222bd9d3598cd0c8c9e741f8c.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <fa462132229bb0c222bd9d3598cd0c8c9e741f8c.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714140110.0c800b30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:05:13 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/mongoose/mongoose.mk      |  8 ++++++++
>  package/mongoose/mongoose.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/mongoose/mongoose.service

Applied after changing to use a relative path for the symlink, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
