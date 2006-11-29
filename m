From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 29 Nov 2006 14:04:21 +0100
Subject: [Buildroot] Buildroot, NAND flash and missing mkfs.jffs2 option
In-Reply-To: <20061128201514.GC27344@aon.at>
References: <1164737384.456c7b6809f9d@imp3-g19.free.fr>
	<20061128201514.GC27344@aon.at>
Message-ID: <1164805461.456d8555257e8@imp2-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

> I think there is at least one report at bugs.busybox.net about jffs2,
> namely an endian fix and maybe another report. It would be great if you
> could verify that the endian patch does break nothing for you, so that i
> can apply it safely and check if there is already a report WRT jffs2 and
> -n. If there is already such a report, then i ask you to be so kind and
> to point me to it and also point out further problems you did encounter
> with jffs2 (like the -n you mentioned above).
>

I didn't find such a report (search with jffs2) so I have open a new one:
http://busybox.net/bugs/view.php?id=1105

If you need a patch to correct the problem, let me know, I can generate one
against Buildroot version 20060908 (the snapshot I'm using).

Regards,
Julien
