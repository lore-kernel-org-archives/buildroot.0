From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:30:02 +0200
Subject: [Buildroot] [PATCH] acpid: bump to version 2.0.22
In-Reply-To: <1398201933-6022-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398201933-6022-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140422233002.33e7ecdd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Apr 2014 18:25:33 -0300, Gustavo Zacarias wrote:
> Switch to upstream sourceforge page/download.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/acpid/Config.in                        |  2 ++
>  package/acpid/S02acpid                         |  4 ++--
>  package/acpid/acpid-01-dont-use-isfdtype.patch | 20 ++++++++++++++++++++
>  package/acpid/acpid.mk                         | 25 ++++++++++++-------------
>  4 files changed, 36 insertions(+), 15 deletions(-)
>  create mode 100644 package/acpid/acpid-01-dont-use-isfdtype.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
