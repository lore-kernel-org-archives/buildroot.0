From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:09:17 +0100
Subject: [Buildroot] [PATCH v2] package/rsyslog: fix musl buil
In-Reply-To: <1454707105-9392-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454707105-9392-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160205230917.0726efb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  5 Feb 2016 22:18:25 +0100, Bernd Kuhls wrote:
> The build error was not yet being found by the autobuilders:
> 
> omfile.c: In function ?prepareFile?:
> omfile.c:580:3: error: implicit declaration of function ?open? [-Werror=implicit-function-declaration]
>    fd = open((char*) newFileName, O_WRONLY|O_APPEND|O_CREAT|O_NOCTTY|O_CLOEXEC,
>    ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: downloaded patch from upstream commit and added as file (Arnout)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
