From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 23:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: fix legal-info
In-Reply-To: <1465661699-6771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465661699-6771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160611235351.4424b261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jun 2016 18:14:59 +0200, Bernd Kuhls wrote:
> The source code files are stored in log4cpp/.
> Apparently LOG4CPP_LICENSE_FILES does not take LOG4CPP_SUBDIR into
> account so we need to fix LOG4CPP_LICENSE_FILES itself.
> 
> Fixes
> http://autobuild.buildroot.net/results/a80/a80e83ca58b22afedb8f2573513d373913c6a488/
> http://autobuild.buildroot.net/results/9eb/9ebb2ed5171d5a1be2db06497a210e552bfad078/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/log4cpp/log4cpp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
