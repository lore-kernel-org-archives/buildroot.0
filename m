From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:53:33 +0200
Subject: [Buildroot] [PATCH] gdb: backport xtensa NPTL support
In-Reply-To: <1440171538-30318-1-git-send-email-jcmvbkbc@gmail.com>
References: <1440171538-30318-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20151012235333.5af71dc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 21 Aug 2015 18:38:58 +0300, Max Filippov wrote:
> These changes allow debugging multithreaded NPTL xtensa applications and
> inspect TLS variables.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../7.9.1/0004-xtensa-implement-NPTL-helpers.patch | 267 +++++++++++++++++++++
>  1 file changed, 267 insertions(+)
>  create mode 100644 package/gdb/7.9.1/0004-xtensa-implement-NPTL-helpers.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
