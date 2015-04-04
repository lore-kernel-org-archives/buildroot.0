From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:44:48 +0200
Subject: [Buildroot] [PATCH/RFC 03/27] package/kodi: bump version to
 15.0 Alpha2-Isengard
In-Reply-To: <1427913380-14808-4-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150404184448.3fea759b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  1 Apr 2015 20:35:56 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/0001-Fixup-include-path.patch |   20 --------------
>  package/kodi/0002-texturepacker.patch      |   12 ++++++++
>  package/kodi/0003-lirc-PR6783.patch        |   41 ++++++++++++++++++++++++++++
>  package/kodi/Config.in                     |   15 +++++-----
>  package/kodi/kodi.mk                       |   33 ++++++++++++----------
>  5 files changed, 78 insertions(+), 43 deletions(-)
>  create mode 100644 package/kodi/0002-texturepacker.patch
>  create mode 100644 package/kodi/0003-lirc-PR6783.patch

Do you know when the final release of Kodi 15.0 is planned? The next
Buildroot version will be 2015.05, with a feature freeze at the end of
April. Will Kodi 15.0 final be released by then? It would be a bit
weird to have a stable Buildroot release with an Alpha version of Kodi
packaged.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
