From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 17 Dec 2012 17:35:16 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <CAHXCMMKXJ8Crr770fXoYz=+SbNcU0VCNXkMcvXsKJKRmd0xsWg@mail.gmail.com>
References: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
 <805796c3-1a48-4485-8d1b-5c1c5d2cbfb4@zimbra2.corp.accelance.fr>
 <CACQ1gAj-H5P3SaX=fhzxpW=aPwp+kJuZw2CQ9AYgmnSKZKpp7g@mail.gmail.com>
 <CAHXCMMKXJ8Crr770fXoYz=+SbNcU0VCNXkMcvXsKJKRmd0xsWg@mail.gmail.com>
Message-ID: <CACQ1gAgBzAdYmraTjnCKLN5G-a6QQSuvPN4Z3KUzaLDNd0UE2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/17 Samuel Martin <s.martin49@gmail.com>:
> Hi Richard,
> There are plenty of good reasons to not use output/target as root for
> a chroot or a NFS root, as explained here:
> http://buildroot.org/downloads/manual/manual.html#faq-why-not-use-target-as-chroot
>
> And here, you'll find the right way to do this (so far):
> http://buildroot.org/downloads/manual/manual.html#_nfs_boot
>
Yes, I know...
It's just more convenient (fast) for me like that:
When I recompile a small software (with make mysoft-reconfigure), I'd
like it to be fast, and de-tar-ing the whole RFS takes some time.
But, it's true that it's not the right way to do it.
(I also always forgot to sudo when I want to copy something to the
nfsroot, so, like that, the tree is mine and there's no cp problem)

Thanks for the links though !

Regards,
Richard.
