From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 14:53:24 +0200
Subject: [Buildroot] [PATCH] bc: patch makeinfo logic
In-Reply-To: <1434199488-11466-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434199488-11466-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150613145324.0e63189f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 13 Jun 2015 09:44:48 -0300, Gustavo Zacarias wrote:
> It uses a hardcoded "makeinfo" command invocation instead of the usual
> MAKEINFO variable with the missing logic for docs. Fixes:
> http://autobuild.buildroot.net/results/b0b/b0b9dced0014a5a8026fa972f95085e8bd16a07b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bc/03_use_appropiate_makeinfo.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/bc/03_use_appropiate_makeinfo.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
