From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:45:26 +0200
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150404184526.2ab0bf51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 26 Jan 2015 20:24:19 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/efl/libevas/0001-giflib.patch |   91 +++++++++++++++++++++++++++++++++
>  package/efl/libevas/Config.in         |    2 +-
>  package/efl/libevas/libevas.mk        |    2 +-
>  3 files changed, 93 insertions(+), 2 deletions(-)
>  create mode 100644 package/efl/libevas/0001-giflib.patch

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
