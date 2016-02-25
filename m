From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:52:12 +0100
Subject: [Buildroot] [PATCH] nfs-utils: Fix autobuilders issues
In-Reply-To: <1454420059-11641-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1454420059-11641-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160225225212.3349f254@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue,  2 Feb 2016 14:34:19 +0100, Maxime Hadjinlian wrote:
> This patch fixes
> http://autobuild.buildroot.net/results/948/948f81d7ed2c080a675ee9fec754f6fda1fd905f/
> 
> The patches has been sent upstream:
> http://article.gmane.org/gmane.linux.nfs/76139
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  ...4-mountd-Add-check-for-struct-file_handle.patch | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch

I've slightly improved the commit title ("Fix autobuilder issues" is
somewhat vague), and I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
