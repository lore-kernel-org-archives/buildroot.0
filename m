From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:41:13 +0200
Subject: [Buildroot] [PATCH 1/3] package/urg: fix build
In-Reply-To: <20160912192324.23682-1-s.martin49@gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
Message-ID: <20160912224113.215c82c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 21:23:22 +0200, Samuel Martin wrote:
> Update select-h patch to also fix the C++ serial driver.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/urg/0001-select-h.patch | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
