From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Apr 2012 17:32:26 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <871ungi39o.fsf@macbook.be.48ers.dk>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
 <201204211505.51141.arnout@mind.be>
 <871ungi39o.fsf@macbook.be.48ers.dk>
Message-ID: <20120422173226.590ca81a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 22 Apr 2012 10:23:15 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I know we have been (are?) using it at work to add some info about the
> build date and name some files with the date.
> 
> Chances are others might have been doing the same, so I'm hessitating
> about removing it (which is why I didn't commit it right away). It
> doesn't really cost us much to keep it (single line).

Well, it's just that I don't very much like to have unused variables
here and there. One way to make it useful is for example to store the
build date into some file in the target filesystem.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
