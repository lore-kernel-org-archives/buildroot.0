From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:15:13 +0100
Subject: [Buildroot] [PATCH v2 1/2] vnstat: bump to version 1.14
In-Reply-To: <1449006851-20917-1-git-send-email-rprebello@gmail.com>
References: <1449006851-20917-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151217221513.0956499d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Tue,  1 Dec 2015 19:54:10 -0200, Rodrigo Rebello wrote:
> Also add new dependency on BR2_USE_WCHAR (version 1.14 uses mbstowcs())
> and rewrap help text to 72 characters.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add dependency on BR2_USE_MMU to comment section (Thomas Petazzoni)
> ---
>  package/vnstat/Config.in   | 16 +++++++++++-----
>  package/vnstat/vnstat.hash |  2 +-
>  package/vnstat/vnstat.mk   |  2 +-
>  3 files changed, 13 insertions(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
