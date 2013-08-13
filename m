From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:20:18 +0200
Subject: [Buildroot] [Bug 6404] New: Buildroot's coreutils 'uname -p'
 reports 'Unknown' on recent ARM kernels
In-Reply-To: <CAANb1FjeQzEL39+P9ztOxYHHN=L=DYsBVjwAMiduWH_8j+6ZqQ@mail.gmail.com>
References: <bug-6404-163@https.bugs.busybox.net/> <5209466E.9030305@mind.be>
 <CAANb1FjeQzEL39+P9ztOxYHHN=L=DYsBVjwAMiduWH_8j+6ZqQ@mail.gmail.com>
Message-ID: <20130813112018.7eecafe1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Banky,

On Mon, 12 Aug 2013 17:14:37 -0700, Martin Banky wrote:
> This is a very long running problem that goes back to at least 2005. Google
> coreutils uname patch, to see the history of this problem. Uname will
> porbably need a different patch to work on ARM kernels.

If it's such a long-standing issue, why hasn't this never been fixed in
upstream coreutils? Some disagreement on what the problem is?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
