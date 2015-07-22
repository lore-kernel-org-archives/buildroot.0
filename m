From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:19:26 +0200
Subject: [Buildroot] [PATCH] boost: fix build for sparc
In-Reply-To: <1437575676-4310-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437575676-4310-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150722171926.3f7fc601@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 11:34:36 -0300, Gustavo Zacarias wrote:
> Using upstream patch, fixes:
> http://autobuild.buildroot.net/results/dd0/dd032aa7b387f3ba5b25bffcaf833ba0ea9ba199/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch

Applied, thanks. Please don't forget to send the patch upstream!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
