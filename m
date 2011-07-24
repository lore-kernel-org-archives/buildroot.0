From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 23:56:27 +0200
Subject: [Buildroot] Zip file package on source forge
In-Reply-To: <-962085729176702675@unknownmsgid> (James Hanley's message of
 "Fri, 22 Jul 2011 12:22:45 -0400")
References: <-962085729176702675@unknownmsgid>
Message-ID: <87bowjuyus.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hanley <jhanley@dgtlrift.com> writes:

 James> I'm trying to add a new package to buildroot, but it's only available
 James> as a zip off of source forge. It downloads fine, but attempts to
 James> "untar" it to which it dies.  Is there a way to specify to buildroot
 James> how to extract the package under the mk file?

With the git version it is, see:

http://git.buildroot.net/buildroot/commit/?id=c4d57780be4677

Simply define <pkg>_EXTRACT_CMDS to do the unzip.

-- 
Bye, Peter Korsgaard
