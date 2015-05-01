From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:23:08 +0200
Subject: [Buildroot] [PATCH] gptfdisk: reinstate ldlibs support patch
In-Reply-To: <1430480956-22474-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430480956-22474-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150501162308.27e19675@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  1 May 2015 08:49:16 -0300, Gustavo Zacarias wrote:
> I removed that in fac3042cc53a9aff87cb047f55a12d23c9973f4d because the
> ICU part was no longer required.
> However the LDLIBS part is for static builds and should have been a
> separate patch to avoid confusion. Fixes:
> http://autobuild.buildroot.net/results/a90/a9092d01a71e2d799e5b7b3afb9fd3e304370d0c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gptfdisk/0001-ldlibs.patch | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/gptfdisk/0001-ldlibs.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
