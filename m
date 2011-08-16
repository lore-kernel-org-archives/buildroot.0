From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Tue, 16 Aug 2011 16:08:14 +0200
Subject: [Buildroot] Trying to package vala (needed to build midori
 0.4.0)
In-Reply-To: <20110815174727.680d45f7@gmail.com>
Message-ID: <20110816160814.66748dc7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok I found out :

I needed to commit my changes in my git.

Otherwise "-dirty" was automatically appended to the program's version
at compile time.

midori 0.4.0 compiles fine, I'll try to produce a correct patch.
