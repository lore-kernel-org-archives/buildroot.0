From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:13:31 +0100
Subject: [Buildroot] [PATCH 01/12] package/apache: bump version to 2.4.18
In-Reply-To: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219141331.3d0018f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Dec 2015 12:01:21 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apache/apache.hash | 4 ++--
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied patches 1 to 9 and patch 11.

I have some concerns on patch 10, and since I believe the nouveau
driver probably needs the newer X.org server version, I didn't merge
patch 12.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
