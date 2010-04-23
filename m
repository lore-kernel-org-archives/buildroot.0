From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Apr 2010 13:25:44 +0200
Subject: [Buildroot] uclibc / glibc rfs issues
In-Reply-To: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
	(Nataraj S. Narayan's message of "Fri, 23 Apr 2010 11:01:07 +0000")
References: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
Message-ID: <87ocha5s1z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

 Nataraj> TCP cubic registered
 Nataraj> NET: Registered protocol family 17
 Nataraj> VFS: Mounted root (jffs2 filesystem) on device 31:0.
 Nataraj> Freeing init memory: 136K
 Nataraj> g_ether gadget: full speed config #1: CDC Ethernet (ECM)
 Nataraj> mount: mounting none on /proc failed: No such file or directory

Sounds like you don't have a /proc directory in your rootfs.

-- 
Bye, Peter Korsgaard
