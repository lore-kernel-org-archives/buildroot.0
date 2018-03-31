From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:53:49 +0200
Subject: [Buildroot] [PATCH 00/15 v4] fs: support parallel filesystems
 build
In-Reply-To: <cover.1522487149.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 31 Mar 2018 11:05:58 +0200")
References: <cover.1522487149.git.yann.morin.1998@free.fr>
Message-ID: <87o9j4t6te.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > TL;DR: filsystems are not parallel-safe, so we generate an intermediate
 > tarball from target/, which then serves as input for the various
 > filesystems; we also run pre-gen hooks under fakeroot, and get rid of
 > post-fs package-provided hooks.

Committed series with the minor fixups pointed out by Arnout and me,
thanks.

-- 
Bye, Peter Korsgaard
