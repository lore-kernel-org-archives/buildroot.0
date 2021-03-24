From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:49:05 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/git: bump version to 2.30.2
In-Reply-To: <20210318201655.32647-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 18 Mar 2021 21:16:54 +0100")
References: <20210318201655.32647-1-ps.report@gmx.net>
Message-ID: <87mtuskw0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fix CVE-2021-21300:
 >   On case-insensitive file systems with support for symbolic links,
 >   if Git is configured globally to apply delay-capable clean/smudge
 >   filters (such as Git LFS), Git could be fooled into running
 >   remote code during a clone.

 > For details see [1] and [2].

 > [1] http://lkml.iu.edu/hypermail/linux/kernel/2102.1/01858.html
 > [2] http://lkml.iu.edu/hypermail/linux/kernel/2103.1/02533.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x, thanks.

For 2020.02.x and 2020.11.x I will instead bump to the corresponding
updates to the git series used there.

-- 
Bye, Peter Korsgaard
