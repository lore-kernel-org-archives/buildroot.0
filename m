From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 15:27:25 +0100
Subject: [Buildroot] [PATCH] libv4l: add patch to fix libjpeg build issue
In-Reply-To: <1453369922-12258-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453369922-12258-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160121152725.2ebf9d6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jan 2016 10:52:02 +0100, Thomas Petazzoni wrote:
> Since the bump of libjpeg to v9b, libv4l doesn't build anymore due to
> the change of the prototype of jpeg_mem_src(), which gets
> re-implemented in libv4l when the libjpeg is too old.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/e7a/e7a2341cbbcf514f4cd6754a5a36cebd6556a757/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...rt-only-expose-jpeg_mem_-protoypes-when-J.patch | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
