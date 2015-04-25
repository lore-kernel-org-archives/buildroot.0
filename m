From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:42:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix compile warning being
 treated as error
In-Reply-To: <1429905652-16930-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429905652-16930-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425114220.3f518a79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 24 Apr 2015 22:00:52 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/b14/b149dcd9bfcf9e69cf7fa16636c3089a6673769a/
> http://autobuild.buildroot.net/results/d45/d45c4abcd22d99edaff8943b0073a94dcd972ab5/
> http://autobuild.buildroot.net/results/1f6/1f6a4a9084a9d07bdd8d6c6dafeedb38d27c0b8f/
> http://autobuild.buildroot.net/results/8f0/8f05242257a0ed059d5258c4a83ab26095516917/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../vlc/0004-implicit-function-declaration.patch   |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/vlc/0004-implicit-function-declaration.patch

Applied, thanks. If you have the courage of submitting our 4 VLC
patches upstream, it would be great :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
