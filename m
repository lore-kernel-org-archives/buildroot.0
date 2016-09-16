From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:01:25 +0200
Subject: [Buildroot] [PATCH] package/urg: fix build (missing header)
In-Reply-To: <20160915044004.10124-1-s.martin49@gmail.com>
References: <20160915044004.10124-1-s.martin49@gmail.com>
Message-ID: <20160916190125.4d1fd9a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 06:40:04 +0200, Samuel Martin wrote:
> Update select-h patch to also fix the C++ serial driver.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cd7/cd76699188d2ee99b5f2d32b6a797de0d832a192/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/urg/0001-select-h.patch | 40 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)

Applied to master, thanks. I had to re-do the patch again, but it was
in fact not your fault, but the usual "line endings" problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
