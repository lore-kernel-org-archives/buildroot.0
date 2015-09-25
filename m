From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 10:03:09 +0200
Subject: [Buildroot] [PATCH] kompexsqlite: don't overwrite CFLAGS and
 CXXFLAGS in makefiles
In-Reply-To: <1442906098-30127-1-git-send-email-jcmvbkbc@gmail.com>
References: <1442906098-30127-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150925100309.451f85cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 22 Sep 2015 10:14:58 +0300, Max Filippov wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/68c1cd7ce7889cf8bad8354e8d7b04e912885cb7
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../0002-append-to-cflags-and-cxxflags.patch       | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
