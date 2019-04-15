From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:51:30 +0200
Subject: [Buildroot] [PATCH 00/12 v3] infra: add solution to dump
 metadata from packages (branch yem/show-info-2)
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <3eb61b4f-2283-f926-2216-0e45ed1bf71a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 21:47, Yann E. MORIN wrote:
> Yann E. MORIN (12):
>       infra/pkg-download: return just a list of URIs
>       infra/pkg-download: make the URI list a callable macro
>       infra/pkg-download: get rid of the FLOCK variable
>       infra/pkg-download: make the DOWNLOAD macro fully parameterised
>       infra/utils: add helper to generate comma-separated lists
>       fs: introduce variables with name and type
>       fs: introduce variable with all recursive dependencies
>       fs: add all recursive dependencies to packages list
>       core: introduce new global show-info
>       core: add per-package and per-filesystem show-info

 1-10 applied to master, thanks.

>       support/scripts: use show-info to extract dependency graph
>       core: remove show-depednency-tree

 I never looked at these before so that might take some time still.

 Regards,
 Arnout
