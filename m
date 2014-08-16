From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 16:46:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/empty: Respect LDFLAGS,
 fix link order
In-Reply-To: <1407682672-25468-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407682672-25468-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140816164635.3d86eea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 10 Aug 2014 16:57:52 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/50f/50fedb54cf005d1177d85c5a34fd10a1c354ba5b/
> http://autobuild.buildroot.net/results/9fc/9fce0825772e99de3c6808b729641147385413aa/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/empty/empty-0001-respect-LDFLAGS.patch |   22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/empty/empty-0001-respect-LDFLAGS.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
