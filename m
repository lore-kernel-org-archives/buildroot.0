From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:13:49 +0200
Subject: [Buildroot] [PATCH] wget: security bump to version 1.18
In-Reply-To: <1465509854-25984-1-git-send-email-gustavo@zacarias.com.ar>
References: <1465509854-25984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160610001349.71721dd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 19:04:14 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4971 - By default, on server redirects to a FTP resource, use
> the original URL to get the local file name.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wget/wget.hash | 2 +-
>  package/wget/wget.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
