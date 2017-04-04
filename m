From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 13:01:13 +0200
Subject: [Buildroot] [PATCH] libiio: Fix tools not linked with pthreads
In-Reply-To: <20170404094326.28344-1-paul.cercueil@analog.com>
References: <20170404094326.28344-1-paul.cercueil@analog.com>
Message-ID: <20170404130113.1b482c67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Apr 2017 11:43:26 +0200, Paul Cercueil wrote:
> Add a patch cherry-picked from the upstream libiio project.
> 
> Fixes:
> http://autobuild.buildroot.net/results/595/595dfd7a17e2bba71844536c9071f7608879e319
> http://autobuild.buildroot.net/results/693/69390ba1f7b1460c3217ef88125faeeeda445f20
> http://autobuild.buildroot.net/results/71e/71ecc80e891a36305b3dacbd12bf8130fe4fd31f
> http://autobuild.buildroot.net/results/4d1/4d1d798ac740403e814b843083b14c9a890dfd54
> http://autobuild.buildroot.net/results/00f/00ffdfce0e7780a0f5a5dfadf6bfd63e51c7bbb8
> http://autobuild.buildroot.net/results/863/863fa72f443c45793df4837992c5c8dc65590c48
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  .../0002-CMake-Test-tools-require-threads.patch    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libiio/0002-CMake-Test-tools-require-threads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
