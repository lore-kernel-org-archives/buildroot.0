From: Julien Boibessot <julien.boibessot@free.fr>
Date: Sun, 07 Feb 2010 18:15:38 +0100
Subject: [Buildroot] .gitignore in BR archives
In-Reply-To: <87bpg1thcf.fsf@macbook.be.48ers.dk>
References: <4B6D8476.8050308@free.fr> <87bpg1thcf.fsf@macbook.be.48ers.dk>
Message-ID: <4B6EF53A.7090401@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>
> I don't think it bothers people, so I would prefer to keep it in the
> tarball (we would need to do special handling to remove it). Other
> git-using projects like the Linux kernel also ships their .gitignore.
>   
ok, so I will use --exclude option of tar to handle my special case (as
suggested by Michael).

Thanks !

Regards,
Julien
