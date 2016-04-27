From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 12:21:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: Do not treat
 conversion warning as error
In-Reply-To: <1461606641-14927-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461606641-14927-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160427122151.574ccf76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 19:50:41 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/74b/74b1b9f8defc275ff2bc3d877faf2863929737b9/
> http://autobuild.buildroot.net/results/71d/71dcaf18e3d42c66af8036a68250eea1be09227b/
> http://autobuild.buildroot.net/results/599/5997a9e4a8ca8b6171438495920d0a487518851c/
> http://autobuild.buildroot.net/results/4ab/4abde1d7fd631d3b50a6b53824a781a08d022bca/
> http://autobuild.buildroot.net/results/968/9680ebd8c804ef15d471519d54f8aa209710414d/
> http://autobuild.buildroot.net/results/d5b/d5be4d51458ca10f3f4ff5fd3ad4b3cfd097f3ad/
> http://autobuild.buildroot.net/results/b1e/b1e3fc27f3d0cdd6ca8f7aff06f7d5e4108817ec/
> http://autobuild.buildroot.net/results/ffb/ffb40572269c63438228000495e1dc78c778788e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...txt-Treat-conversion-warning-as-error-onl.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/jsoncpp/0001-CMakeLists.txt-Treat-conversion-warning-as-error-onl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
