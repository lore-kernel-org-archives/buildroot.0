From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 19:01:32 +0100
Subject: [Buildroot] [PATCH v2 resend] support/kconfig: fix compile
 warning because of missing include.
In-Reply-To: <1383083612-9871-1-git-send-email-ps.report@gmx.net>
References: <1383083612-9871-1-git-send-email-ps.report@gmx.net>
Message-ID: <20131030190132.4eecbb7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 29 Oct 2013 22:53:32 +0100, Peter Seiderer wrote:
> With commit b58bf60b519353e983e372f5627d639e7cc72a7a the libgen.h
> include was removed from confdata.c, but it is needed for the dirname
> function declaration.
> 
> Fixes the following compile warning:
> ./confdata.c: In function ?conf_split_config?:
> ./confdata.c:849:6: warning: assignment makes pointer from integer
> without a cast
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks, applied to for-peter-2013.11.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
