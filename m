From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 23 Mar 2015 14:10:41 +0100
Subject: [Buildroot] [PATCH 7/7 v3] support/download: warn when there's
 no .hash file
In-Reply-To: <a30751a9b30f9cc2b22bacffa659ef311622e180.1427037564.git.yann.morin.1998@free.fr>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <a30751a9b30f9cc2b22bacffa659ef311622e180.1427037564.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+25U7JaXST=5mh_F2rK8Wtg3bvePRYsnyd-vbWszdsew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2015 at 4:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Instead of silently accepting a missing .hash file, print a warning.
>
> This can be grepped from a build log, to find packages that still have
> no hash, with the long-term goal of adding hashes for all packages.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
