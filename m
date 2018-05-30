From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 May 2018 17:52:57 +0200
Subject: [Buildroot] [sources.buildroot.net] listing not available
In-Reply-To: <CAL3OuNxjyRhG2c3-fBakZ7iSd+Vf+KqrKBdOSwzDrcNM_ajGqw@mail.gmail.com>
 (Bruno N.'s message of "Wed, 30 May 2018 14:43:07 +0200")
References: <CAL3OuNxjyRhG2c3-fBakZ7iSd+Vf+KqrKBdOSwzDrcNM_ajGqw@mail.gmail.com>
Message-ID: <87po1d2l9i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bruno" == Bruno N <belgarath116@gmail.com> writes:

 > Hello,
 > I have make a copy of the repository http://sources.buildroot.net for an
 > offline computer.
 > Since some week i can't update my copy because the website don't list
 > available packages.
 > (I was using "wget --mirror" to make the copy)

 > Is it possible to have the list of packages again ? (with something like
 > the apache's mod_dir)

Does it really make sense to make a copy of everything? This is
currently > 160GB.

> Or maybe are they an other way to make a copy of the repository ?

If you just want to make sure you have downloaded everything needed to
build a specific configuration then you can use 'make source'

-- 
Bye, Peter Korsgaard
