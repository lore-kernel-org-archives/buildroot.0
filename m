From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 25 Feb 2009 10:00:01 +0100
Subject: [Buildroot] Cris strace-4.5.18 patch
In-Reply-To: <49A50682.2050903@cetrtapot.si>
References: <49A50682.2050903@cetrtapot.si>
Message-ID: <20090225100001.3e6bffd7@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Feb 2009 09:51:14 +0100
Hinko Kocevar <hinko.kocevar@cetrtapot.si> wrote:

> Hi,
> 
> I have this patch laying around for some time. I'm using it 
> for our cris embedded target and haven't had any issues with it.
> 
> Please apply.
> 

It does not apply at CVS HEAD, so I would recommend that you checkout
the source code from CVS and rebase against it.

See http://sourceforge.net/cvs/?group_id=2861

> Note, that configure needs to be rebuilt (autoreconf) before
> configure.ac changes are employed into the configure script.
> 

Another note, ./configure is not present at all in CVS, so an
autoreconf is mandatory to compile CVS and AFAICT done when cutting
releases. So no worries :)

-- 
Best regards,
Hans-Christian Egtvedt
