From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 11:55:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/ola: fix musl build
In-Reply-To: <1454147144-27111-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454147144-27111-1-git-send-email-bernd.kuhls@t-online.de>
 <1454147144-27111-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160202115506.00388279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 10:45:44 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/17f/17fe88868acdbba074561da14c4417e31d506823/
> http://autobuild.buildroot.net/results/d99/d99ca60cc4bf86c338fd61f9fd2de0bb9598d670/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0002-Fix-build-errors-with-musl-C-library.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/ola/0002-Fix-build-errors-with-musl-C-library.patch

Since your patch has been merged upstream (good!), I've changed this
commit to use OLA_PATCH pointing to the github commit, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
