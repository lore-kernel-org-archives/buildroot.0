From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 08:09:31 +0200
Subject: [Buildroot] [PATCH 0/2] Download patches for Busybox
In-Reply-To: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 24 Apr 2013 04:22:45 +0200")
References: <1366770167-22834-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738ugcvdw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> As recently discussed on the list, here are two patches that
 Thomas> let the busybox package download its patches, instead of
 Thomas> storing them in Buildroot's source tree.

Thanks. There's one big problem with busybox though. Denys tends to
update the patches without renaming them if more problems are found in
those applets - So we end up with different results depending on when
you build.

Perhaps we can convince him to do otherwise, but until then I would
prefer to keep it like it is.

-- 
Bye, Peter Korsgaard
