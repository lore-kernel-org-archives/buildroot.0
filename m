From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:36:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/harfbuzz: fix test-unicode
 static linking issue
In-Reply-To: <1437601623-3001-2-git-send-email-romain.naour@openwide.fr>
References: <1437601623-3001-1-git-send-email-romain.naour@openwide.fr>
 <1437601623-3001-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150723233642.4923e1cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 22 Jul 2015 23:47:03 +0200, Romain Naour wrote:
> When linking test-unicode statically, it needs $(ICU_LIBS)
> which contains all required flags.
> Especially -lstdc++.
> 
> Fixes:
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../0001-fix-static-linking-with-icu-uc.patch      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/harfbuzz/0001-fix-static-linking-with-icu-uc.patch

Applied, thanks. Please also submit upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
