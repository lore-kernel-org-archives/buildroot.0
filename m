From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Fri, 01 May 2009 19:05:16 +0200
Subject: [Buildroot] HEADS UP: svn->git transition
In-Reply-To: <200905011856.30347.vda.linux@googlemail.com>
References: <20090429113849.GB18534@mx.loc>
	<20090429143400.GC18534@mx.loc>	<49FB2082.2000501@gmail.com>
	<200905011856.30347.vda.linux@googlemail.com>
Message-ID: <49FB2BCC.3050408@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Busybox svn has been migrated to git.
>
> I check out fresh tree with:
>
> git clone git+ssh://vda at busybox.net/var/lib/git/busybox.git
>
> Then in that tree I can do:
>
> git pull          -- analog of "svn update"
> git add new_file  -- IIUC this is "svn add" analog
> git commit -a     -- create a local change which includes all files
>                      modified since last commit.
>   

You can add -s :

git commit -a -s

In order to have a "Signed-off-by" added automatically.
