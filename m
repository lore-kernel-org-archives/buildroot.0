From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:53:36 +0200
Subject: [Buildroot] [PATCH v2] package/oprofile: fix gcc6 build issue
In-Reply-To: <1475945602-19996-1-git-send-email-romain.naour@gmail.com>
References: <1475945602-19996-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161009135336.5f204fc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Oct 2016 18:53:22 +0200, Romain Naour wrote:
> Backport a patch from upstream to fix a gcc6 build issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d9f/d9f2f771f8515a1ac17009e233a135b5af58ea00
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Add autobuilder reference
> ---
>  .../0002-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
