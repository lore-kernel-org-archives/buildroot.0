From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:59:42 +0100
Subject: [Buildroot] [PATCH 1/2] gnutls: remove manual doc disabling
 kludge
In-Reply-To: <1450118498-30750-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450118498-30750-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215215942.2308ad34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Dec 2015 15:41:37 -0300, Gustavo Zacarias wrote:
> It's no longer required, SUBDIRS += doc is guarded by ENABLE_DOC in
> Makefile.am and the only place where it's used regardless is in
> dist-hook which isn't used by buildroot.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gnutls/gnutls.mk | 6 ------
>  1 file changed, 6 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
