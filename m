From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:30:51 +0200
Subject: [Buildroot] [PATCH 2/2] libcgicc: bump to version 3.2.13
In-Reply-To: <1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
References: <1396135140-1402-1-git-send-email-gustavo@zacarias.com.ar>
 <1396135140-1402-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140330113051.5c43cc69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 29 Mar 2014 20:19:00 -0300, Gustavo Zacarias wrote:
> Also add license files and docs license definition.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcgicc/libcgicc.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks, with one minor change.

> +LIBCGICC_LICENSE = LGPLv3+, docs: GFDL1.2+

I've changed this to the more traditional:

	LGPLv3+ (library), GFDL1.2+ (docs)

Though I'm wondering if:

 * We shouldn't use GFDLv1.2+ instead, like we do for GPL/LGPL.

 * Whether we should really worry about the documentation license,
   since we don't allow the installation of the documentation on the
   target. I don't think we have any other package that describe the
   license of their documentation.

Cc'ing Luca and Yann to get an opinion on this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
