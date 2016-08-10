From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:22:37 +0200
Subject: [Buildroot] [PATCH] fontconfig: security bump to version 2.12.1
In-Reply-To: <1470796216-19612-1-git-send-email-gustavo@zacarias.com.ar>
References: <1470796216-19612-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160810142237.29de98b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 23:30:16 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-5384 - possible double free due to insufficiently validated
> cache files.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/fontconfig/fontconfig.hash | 4 ++--
>  package/fontconfig/fontconfig.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to master as it is a security bump, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
