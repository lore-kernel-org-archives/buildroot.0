From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:46:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: security bump to version
 17.3
In-Reply-To: <20170525212620.2562-1-bernd.kuhls@t-online.de>
References: <20170525212620.2562-1-bernd.kuhls@t-online.de>
Message-ID: <20170528154603.0bced7d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 23:26:20 +0200, Bernd Kuhls wrote:
> Release notes:
> https://kodi.tv/article/kodi-v173-minor-bug-fix-and-security-release
> 
> "Fix possible security flaw which could abused .zip files which try to
>  traverse to a parent directory"
> 
> For details about the security bug refer to
> http://blog.checkpoint.com/2017/05/23/hacked-in-translation/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>  package/kodi/kodi.hash                                   | 2 +-
>  package/kodi/kodi.mk                                     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
