From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 23:34:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: Do not add libdl to
 LINKER_LIBS for static builds
In-Reply-To: <20160924173157.2330-1-bernd.kuhls@t-online.de>
References: <20160924173157.2330-1-bernd.kuhls@t-online.de>
Message-ID: <20161026233412.7b4c2b9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 19:31:57 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/765/7657e01481995a4f0d725467e935a83928a59a04/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/opencv/0004-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch

Applied to master, thanks. Could you please follow-up with the feedback
from upstream in the Github pull request?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
