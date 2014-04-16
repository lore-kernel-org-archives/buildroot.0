From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:54:13 +0200
Subject: [Buildroot] [PATCH v4 4/4] luajit: needs for 32bit
 archictectures a 32bit host gcc
In-Reply-To: <1396864610-8426-5-git-send-email-fabio.porcedda@gmail.com>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140416195413.3c7f7006@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon,  7 Apr 2014 11:56:50 +0200, Fabio Porcedda wrote:
> For 32 bit archictectures the luajit package needs a host compiler
> able to generate 32 bit code using the "-m32" option so check if that
> option is supported.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fran?ois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
