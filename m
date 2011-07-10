From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 15:31:33 +0200
Subject: [Buildroot] [PATCH 15/28] grub2: remove package
In-Reply-To: <41b9f835e983516f570512d44799a9b8c7cd0601.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:06 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <41b9f835e983516f570512d44799a9b8c7cd0601.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y606xnwq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Grub 2 has been marked BROKEN in June 2010, and nobody cared to fix it
 Thomas> since then.

 Thomas> At that time, it was marked broken because the build process needed a
 Thomas> Ruby interpreter available on the host, and it's really a pain that
 Thomas> building a bootloader needs such a thing.

 Thomas> I've tried to upgrade the package to Grub2 1.99-rcX, and now it does
 Thomas> not need a Ruby interpreter anymore, but instead requires a tool
 Thomas> called "autogen", which itself needs the Guile Scheme interpreter.

 Thomas> Since we haven't heard any complaints about Grub2 being marked broken,
 Thomas> and since it's such a pain to package, let's get rid of it. Of course,
 Thomas> anybody interested in Grub2 is invited to contribute a working
 Thomas> package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
