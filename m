From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:34:03 +0200
Subject: [Buildroot] [PATCH 27/38] ti-gfx: systemd support
In-Reply-To: <3afa99779c3b299f255ea8e1330c124f31b02fd6.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <3afa99779c3b299f255ea8e1330c124f31b02fd6.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150715003403.21f6709b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:07:32 +0300, Alex Suykov wrote:
> The startup script too complex to embed it completely into
> the .service file, so it is left as a standalone script.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/ti-gfx/ti-gfx.mk      | 10 ++++++++++
>  package/ti-gfx/ti-gfx.service | 11 +++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 package/ti-gfx/ti-gfx.service

Applied with some minor changes:

    [Thomas:
     - use relative path for the symbolic link
     - slightly tweak the service Description string]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
