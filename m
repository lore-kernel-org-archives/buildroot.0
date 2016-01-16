From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:07:35 +0100
Subject: [Buildroot] [PATCH v1 1/2] assimp: fix bfin compile
In-Reply-To: <1452807861-1020-1-git-send-email-ps.report@gmx.net>
References: <1452807861-1020-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160116140735.32b862b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 14 Jan 2016 22:44:20 +0100, Peter Seiderer wrote:
> Use proper 64-bit constant for CONVERT_FBX_TIME(time) conversion.
> 
> Fixes ([1]):
> 
>   code/FBXConverter.cpp:2025: error: integer constant is too large for 'long' type
>   code/FBXConverter.cpp:2026: error: integer constant is too large for 'long' type
>   code/FBXConverter.cpp:2794: error: integer constant is too large for 'long' type
>   code/FBXConverter.cpp:2868: error: integer constant is too large for 'long' type
>   code/FBXConverter.cpp:2878: error: integer constant is too large for 'long' type
>   code/FBXConverter.cpp:2888: error: integer constant is too large for 'long' type
> 
> [1] http://autobuild.buildroot.net/results/885/8853b192d16ca7ef769c5352a2df0540a7a2a4fd
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...x-FBXConverter-use-proper-64-bit-constant.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch

Both patches applied, thanks! For the first patch, please make sure to
submit it upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
