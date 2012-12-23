From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Dec 2012 08:37:00 +0100
Subject: [Buildroot] XBMC
In-Reply-To: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
 (Maxime Hadjinlian's message of "Sat, 22 Dec 2012 00:58:49 +0100")
References: <CAGduivzZU=-GOQzAj4keyBVVMZ=9zuXaHX0wD68X7VSpB-c1aQ@mail.gmail.com>
Message-ID: <877go9usmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> Hi everyone,
 Maxime> I wanted to add XBMC to buildroot, but since it's a pretty big
 Maxime> application with a lot of dependency, I have created a separated tree
 Maxime> at github :
 Maxime> https://github.com/maximeh/buildroot

 Maxime> I would like to know if it would be of any interest to upstream
 Maxime> this before sending all theses patches for review ?

I believe there's interest, but we probably need to improve our
OpenGL(ES) support to make it really useful.

Scott Davilla is also working on XBMC packages, but has not posted any
patches yet:

https://github.com/Pivosgroup/buildroot-linux

-- 
Bye, Peter Korsgaard
