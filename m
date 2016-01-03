From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 21:51:56 +0100
Subject: [Buildroot] [PATCH] support/download: generate reproducible
	Bazaar archives
In-Reply-To: <1451747202-21873-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 2 Jan 2016 16:06:42 +0100")
References: <1451747202-21873-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8737ueo07n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Similarly to what has previously been done for the Hg download backend,
 > instruct bzr to generate the archive on stdout, so that we can generate
 > reproducible archives.

 > When instructing bzr to generate the output file by itself, it uses a
 > temporary file that is then fed to gzip, which in turn stores the
 > timestamp of that file in the generated archive, whereas when the output
 > is generated on stdout, there is no timestamp, so the archive is then
 > reproducible.

 > Bizarely enough, we can tell 'bazaar' not to generate a bazaar in the
 > archive. Cool, uh? ;-]

:P

Committed, thanks.

-- 
Bye, Peter Korsgaard
