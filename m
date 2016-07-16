From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:06:53 +0200
Subject: [Buildroot] [PATCH] package/duma: fix build with C++14
In-Reply-To: <1468181086-17042-1-git-send-email-yann.morin.1998@free.fr>
References: <1468181086-17042-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160716110653.1cd00b67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 22:04:46 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/f7f/f7fc0092ec43a5a4bc38b5e6878842df77f32d3a/
>     http://autobuild.buildroot.org/results/7ae/7ae0d5e4821c70077fc1731f578e8222e9d6691b/
>     http://autobuild.buildroot.org/results/438/438032a6d6a38c9929cd26dffb8b3c5d1aed9106/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/duma/0003-fix-C++14.patch | 65 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/duma/0003-fix-C++14.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
