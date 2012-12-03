From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 3 Dec 2012 10:21:06 +0100
Subject: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
In-Reply-To: <2f772bd2-fecd-4aeb-9bbe-83316ac7deed@zimbra2.corp.accelance.fr>
References: <CAJJ6jxvVkLmLmMiC+3bKEqokBUd1-LrJ8nJywzYmtVYxbXsSNQ@mail.gmail.com>
 <2f772bd2-fecd-4aeb-9bbe-83316ac7deed@zimbra2.corp.accelance.fr>
Message-ID: <CAHXCMMLOF7j8jf55hZiQTwE1S2szCn0Ref02h6_Nn-Qo72T5Sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy, all,

2012/12/3 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> well, it's more a question of what you consider the live filesystem to be...
>
> I see it a as just another filesystem format (basically a NFS target) which is why my original patch had it in output/images/live
>
> if you see it as a deployment, it does not really make sense to add it to buildroot (buildroot doesn't flash the filesystem directly) I can understand that both point of view make sense
>
> however having this target makes things simpler in a very common use case (arguably the most common use case since it's the case where you use buildroot repeatedly to prepare the fs, not the case where you run it once to build the final FS)

That's a controversial topic...
But, at least, you cat start filling the gap in the doc ;-),
especially this section:
http://buildroot.org/downloads/manual/manual.html#_beyond_buildroot


-- 
Sam
