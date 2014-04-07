From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Apr 2014 15:41:48 +0200
Subject: [Buildroot] [PATCH] eglibc: bump to version 2.19 SVN R25243
In-Reply-To: <5342A9EB.1030801@zacarias.com.ar>
References: <1396875879-22199-1-git-send-email-gustavo@zacarias.com.ar>
 <20140407152919.2d1147fb@skate> <5342A9EB.1030801@zacarias.com.ar>
Message-ID: <20140407154148.2b35dd34@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 07 Apr 2014 10:36:43 -0300, Gustavo Zacarias wrote:

> > So we don't do like glibc where we support both 2.18 and 2.19 ? This is
> > really a question, maybe it makes sense to only support one version at
> > a time. In which case we could remove 2.18 from glibc.
> 
> My opinion is that we should just keep it as simple as possible.
> If there's a special need for some architecture (like microblaze) let it
> be so, but really unless we know there's some issue or exception i don't
> think there's much value in keeping multiple versions, specially since
> *glibc is backwards ABI compatible.

Fine with me. My impression so far was that for critical components
such as gcc/binutils/gdb/libc, we were keeping older versions a little
bit longer to give it some time to test the newer version before
forcing everyone to upgrade. Surely we need to continue to do this with
gcc, where most of the 4.x.0 versions are typically broken on at least
one architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
