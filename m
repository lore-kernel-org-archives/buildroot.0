From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 22 Jul 2015 19:51:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/qpid-proton: disable languages
 bindings
In-Reply-To: <1437574390-31175-2-git-send-email-romain.naour@openwide.fr>
References: <1437574390-31175-1-git-send-email-romain.naour@openwide.fr>
 <1437574390-31175-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <55AFD83A.4070308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain,

Romain Naour wrote:
> Fixes (workaround):
> http://autobuild.buildroot.net/results/eff48f8a827f8b4dbbdb7cb648a6c4a3ab4ac8a5/
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>
> Hi Luca,
>
> The dependency on host-swig is missing in qpid-proton package.
> Therefore languages bindings are enabled when the swig tool is found, but
> for each languages bindings the target package dependency is missing.
>
> The build failure [1] occurs only when host-swig is available *and* python
> target package is build before qpid-proton.
>
> Is it ok for you to disable all bindings ?

No objections. I only care about the C APIs.

Of course anybody interested can add (and fix) bindings as needed.

Thanks for having fixed this issue.

-- 
Luca
