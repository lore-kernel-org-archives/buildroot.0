From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 21:01:33 +0200
Subject: [Buildroot] [PATCHv2] package: add comment about ipkg/opkg/rpm
In-Reply-To: <1440356281-10227-1-git-send-email-yann.morin.1998@free.fr>
References: <1440356281-10227-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150823210133.052f5b5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 23 Aug 2015 20:58:01 +0200, Yann E. MORIN wrote:
> Too often the question is raised, that ipkg, opkg and rpm do not work,
> and users complain they can not install packages.
> 
> Even though we do have a clear and clearly explained section in our
> manual, people do not read it (when will users read manuals? sigh...).
> 
> So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
> generate binary packages and does not provide any package database for
> any of those package manager.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - don't use U+00A0 as first char on empty lines  (Arnout)
> ---
>  package/Config.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
