From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 13:26:11 +0200
Subject: [Buildroot] [PATCH] PPC: fix ltrace build on PPC32
In-Reply-To: <1406632569-15162-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1406632569-15162-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20140729132611.67000a86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Tue, 29 Jul 2014 13:16:09 +0200, Alexandre Belloni wrote:
> Add a patch to fix the build on PPC32 platform. That patch has been
> submitted upstream.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch

Thanks, applied. I've added a reference to the appropriate autobuilder
failure. Please make sure to include such a reference next time you
submit a patch fixing an issue raised by the autobuilders.

Thanks! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
