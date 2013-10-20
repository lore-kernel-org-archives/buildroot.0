From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 20 Oct 2013 21:14:04 +0200
Subject: [Buildroot] [PATCH 05/12] manual: developer-guide.txt:
	cleanup	non-existing source
In-Reply-To: <7700f2e0c15dc3131a2965bc3f89391a28867491.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com><cover.1382127504.git.s.martin49@gmail.com>
 <7700f2e0c15dc3131a2965bc3f89391a28867491.1382127504.git.s.martin49@gmail.com>
Message-ID: <985dc272-82bf-44e9-b08d-d418e6656179@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> wrote:
>Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>---
> docs/manual/developer-guide.txt | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
>index 43272f5..8125ad5 100644
>--- a/docs/manual/developer-guide.txt
>+++ b/docs/manual/developer-guide.txt
>@@ -11,5 +11,3 @@ include::adding-packages.txt[]
> include::patch-policy.txt[]
> 
> include::download-infra.txt[]
>-
>-include::board-support.txt[]

This patch was already acked by ThomasP and myself. I don't see any changes? It's easier for reviewers if you'd take along such acks when sending newer versions.

Best regards,
Thomas
