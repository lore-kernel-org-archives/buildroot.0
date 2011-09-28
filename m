From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2011 17:49:58 +0200
Subject: [Buildroot] [PATCH] add libfcgi to buildroot it will have
 compiling errors as long as -lm isnt added to the buildsystem of libfcgi
In-Reply-To: <000001cc7def$9ff6a920$dfe3fb60$@com>
References: <add fcgi-2.4.0 package to buildroot>
 <1317219200-4655-1-git-send-email-bachmann@tofwerk.com>
 <20110928163020.6350cc9b@skate>
 <000001cc7def$9ff6a920$dfe3fb60$@com>
Message-ID: <20110928174958.2a4f433c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 28 Sep 2011 17:02:21 +0200,
"Rico Bachmann" <bachmann@tofwerk.com> a ?crit :

> that wasn't planed ^^ i didn't know that all my comments get i to the subject.
> next time i will use the blank line. Did i have to commit the patch a second time, because of the long subject?

You can simply do a :

	git commit --amend

to modify the commit message of the topmost commit.

> i have 2 patches that fix that problem, but i don't know how to add patches to buildroot for files that are created in the build/fcgi-2.4.0/ when fcgi-2.4.0.tar.gz is unpacked
> 
> http://lists.busybox.net/pipermail/buildroot/2011-September/046084.html
> 
> in this link you can see the patches for 2 makefiles (they're attached to the mail). It is the solution to the -lm problem, but i don't know how to add that to buildroot.

Simply add them in package/fcgi/, under a name like
fcgi-2.4.0-some-useful-description.patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
