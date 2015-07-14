From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 14:04:00 +0200
Subject: [Buildroot] [PATCH 30/38] tinyhttpd: systemd support
In-Reply-To: <4de07aed2aa8ff5ece608548b6eed6d357f14a3f.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <4de07aed2aa8ff5ece608548b6eed6d357f14a3f.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150714140400.3e134702@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:08:37 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/tinyhttpd/tinyhttpd.mk      |  8 ++++++++
>  package/tinyhttpd/tinyhttpd.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/tinyhttpd/tinyhttpd.service

Applied after changing the link to use a relative path, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
