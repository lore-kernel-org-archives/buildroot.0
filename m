From: Faye <faye2040@gmail.com>
Date: Tue, 6 Jan 2009 17:22:43 +0800
Subject: [Buildroot] I do need make rootclean install
Message-ID: <fe1063720901060122t1b18525fx2400279632734456@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all

I noticed that there is a strange thing happened.
When I recompile kernel more than once or twice,
sometimes the final root fs ramdisk will grow larger and larger
even I do not change anything specially in linux26-menuconifg.

Thus, I usually try to rebuild everything from beginning to
ensure that this never occurs.

Hence, why not giving an make option of "rootclean" and/or "rootbuild" !?

I searched the archive of mailing list and do find somebody once
propose such idea.

So nobody encounters the similar issue as I met? :-( Strangely.

Anthony
