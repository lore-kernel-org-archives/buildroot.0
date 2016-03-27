From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 22:36:34 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain-external: unify
 LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
In-Reply-To: <1455304826-10557-6-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-6-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56F84452.7070009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/16 20:20, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
>
> With the alignment of toolchain library location in target and staging,
> there is no need anymore for the distinction between LIB_EXTERNAL_LIBS and
> USR_LIB_EXTERNAL_LIBS. Unify them into TOOLCHAIN_EXTERNAL_LIBS.
>
> Related, update the help text of
> BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   toolchain/toolchain-external/Config.in             |  3 +--
>   toolchain/toolchain-external/toolchain-external.mk | 22 +++++++++++-----------
>   2 files changed, 12 insertions(+), 13 deletions(-)


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
