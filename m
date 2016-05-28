From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 10:58:21 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/kodi: add backported patch
 to fix a bug when using taglib 1.11
In-Reply-To: <1464420013-23211-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464420013-23211-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160528105821.40f21523@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 09:20:12 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ding-issue-when-reading-certain-id3v1-tag.patch | 82 ++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
