From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:10:50 +0200
Subject: [Buildroot] [PATCH v2] package/tinyxml2: fix cmake warning
In-Reply-To: <1431082195-22498-2-git-send-email-romain.naour@openwide.fr>
References: <1431082195-22498-1-git-send-email-romain.naour@openwide.fr>
 <1431082195-22498-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150516141050.4ec449f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  8 May 2015 12:49:55 +0200, Romain Naour wrote:
> CMake complains about Policy CMP0037 that reserve some
> target name such "test".
> So remove the warning by renaming test to xmltest.
> 
> Backport an upstream patch:
> 0b2c22bd46be95b08f234b8b4cb262f72ab3f0e8
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../0002-Rename-test-fixed-cmake-warning.patch     | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
