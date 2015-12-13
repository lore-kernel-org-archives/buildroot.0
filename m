From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:38:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/read-edid: Fix compiler
 check, c++ is not needed
In-Reply-To: <1450019762-21731-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450019762-21731-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213223809.197e7ed1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 16:16:02 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/8c1/8c11e463b68121fe0331acf9f8a42a1d3fef40c7//
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: read-edid does not need c++, added new patch suggested by Thomas

Applied, thanks. Please submit the patch upstream :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
