From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:23:58 +0100
Subject: [Buildroot] [PATCH] fs: add missing $$(sep) to pre- and
 post-command hooks code
In-Reply-To: <20171103184953.32650-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Fri, 3 Nov 2017 11:49:53 -0700")
References: <20171103184953.32650-1-andrew.smirnov@gmail.com>
Message-ID: <87wp2chjq9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > When multiple hooks are registred, both pre-a and post-command hooks'
 > foreach loops need to have a separator at the end in order for the
 > code to work as intended. Without the separator all hooks end up as a
 > one single line command thus making all but the first hook into
 > no-ops.

 > Fixes: 4628b6f3b4 ("fs: add pre- and post-command hooks")
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
