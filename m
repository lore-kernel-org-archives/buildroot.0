From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 22:36:45 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix lsipc segfault
In-Reply-To: <1458680998-912-1-git-send-email-romain.naour@gmail.com>
References: <1458680998-912-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160322223645.6fe2d7af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 22:09:58 +0100, Romain Naour wrote:
> lsipc segfault when no option is given.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...don-t-free-shm-data-if-no-shm-id-is-found.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch

Applied to master, thanks. Please submit upstream, of course.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
