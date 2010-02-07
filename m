From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 7 Feb 2010 07:32:31 -0600
Subject: [Buildroot] .gitignore in BR archives
In-Reply-To: <87bpg1thcf.fsf@macbook.be.48ers.dk>
References: <4B6D8476.8050308@free.fr> <87bpg1thcf.fsf@macbook.be.48ers.dk>
Message-ID: <201002070732.37983.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun February 7 2010, Peter Korsgaard wrote:
> >>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:
> 
>  Julien> Hello,
>  Julien> in the BR tarballs (recent releases or daily snapshots), got from here:
>  Julien> http://www.buildroot.org/download.html , there is a .gitignore file at
>  Julien> the top of the directory hierarchy.
>  Julien> Is this something you need or can it be removed for the next tarball
>  Julien> releases ? (It can be problematic when de-archiving BR in already git
>  Julien> versioned dirs.)
> 

Perhaps just tell your archive tool to exclude it when un-archiving?
As in: tar --extract --exclude=PATTERN 
Ref: man tar

Mike
> It's not that you *REALLY* need it, but it's nice if you're using git as
> the git status output isn't cluttered.
> 
> I don't think it bothers people, so I would prefer to keep it in the
> tarball (we would need to do special handling to remove it). Other
> git-using projects like the Linux kernel also ships their .gitignore.
> 
