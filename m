From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Mar 2010 21:37:33 +0100
Subject: [Buildroot] jffs2 problem
In-Reply-To: <630286c71003122354rb2e6146ofe939c85465b74e5@mail.gmail.com>
	(Nataraj S. Narayan's message of "Sat, 13 Mar 2010 13:24:43 +0530")
References: <630286c71003122354rb2e6146ofe939c85465b74e5@mail.gmail.com>
Message-ID: <87wrxgyn3m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

Hi,

 Nataraj> When doing by hand, which works , i use:-

 Nataraj> #sudo mkfs.jffs2 --pad --little-endian --eraseblock=0x20000 -n -o
 Nataraj> last.jffs2  -s 0x800 -r /media/usb/

So what is the difference between this and what BR does?
- What commandline does BR use?
- Does the above work if you use the mkfs.jffs2 built by BR?

-- 
Bye, Peter Korsgaard
