From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:32:26 +0100
Subject: [Buildroot] [PATCH v2] qt5: disable qt-5.8.0 support for arc,
 nios2 and xtensa
In-Reply-To: <20170222183105.27503-1-ps.report@gmx.net>
References: <20170222183105.27503-1-ps.report@gmx.net>
Message-ID: <20170222213226.2a9828f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 19:31:05 +0100, Peter Seiderer wrote:
> Fixes [1], [2], [3]:
> 
>   ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
> 
> [1] http://autobuild.buildroot.net/results/ce6/ce6f506f610434dff1d0eb64644be0200d7c52f6
> [2] http://autobuild.buildroot.net/results/fda/fda8a5165cc599adfa4b3cb012916fa4dc38aeca
> [3] http://autobuild.buildroot.net/results/779/779fd562c28f3a47f9caea7d0e0cb1dcda7fe489
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - optimized arc test !BR2_arc (suggested by Thomas Petazzoni)
> ---
>  package/qt5/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
