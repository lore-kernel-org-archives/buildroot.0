From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:48:46 +0200
Subject: [Buildroot] [PATCH next] flatcc: bump to version 0.5.2
In-Reply-To: <4bbfb28ee09b15fc0ee235b3b6ed47a9e4473b9b.1535458461.git.baruch@tkos.co.il>
References: <4bbfb28ee09b15fc0ee235b3b6ed47a9e4473b9b.1535458461.git.baruch@tkos.co.il>
Message-ID: <20180828224846.1571ab83@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 15:14:21 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Add license file hash.
> 
> Cc: Joel Carlson <JoelsonCarl@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...cc-8-warning-add-flatbuffers_type_ha.patch | 138 ------------------
>  package/flatcc/flatcc.hash                    |   3 +-
>  package/flatcc/flatcc.mk                      |   2 +-
>  3 files changed, 3 insertions(+), 140 deletions(-)
>  delete mode 100644 package/flatcc/0001-Remove-strncpy-gcc-8-warning-add-flatbuffers_type_ha.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
