From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 12 Jan 2014 22:21:36 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr> <8738kt3t5f.fsf@dell.be.48ers.dk>
 <20140112200937.GC3374@free.fr>
Message-ID: <0kdbqax73q.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140112200937.GC3374 at free.fr: 

> An third alternative is to add a package/pkg/pkg.hash file, which
> contains the list of files, and their hashes; in fact, the output of the
> hash util we'd use:
>     ABCDEF1234567890  foo-1.2.3.patch
>     ABCDEF1234567890  bla.patch
>     ABCDEF1234567890  file.bin

Hi,

FYI: the Gentoo project stores file hashes like this:

http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-misc/ca-
certificates/Manifest?view=markup

Regards, Bernd
