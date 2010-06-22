From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 22 Jun 2010 21:31:58 +0000 (UTC)
Subject: [Buildroot] Suggestion for config menu help for path values
References: <hvr8t1$io0$1@dough.gmane.org>
Message-ID: <hvra4e$mpj$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> Right now I'm trying to figure out the CWD when the post-build script
> is called, and I'll submit a help patch when I figure out the answer.

So far it appears buildroot looks in $PATH for the post-build script,
but I can't figure out what directories (if any) in the buildroot
source/build tree it looks in.

-- 
Grant Edwards               grant.b.edwards        Yow! You were s'posed
                                  at               to laugh!
                              gmail.com            
