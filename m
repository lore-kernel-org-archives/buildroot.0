From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2020 10:14:24 +0200
Subject: [Buildroot] Buildroot 2020.02.5 released
In-Reply-To: <87mu2ddye0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 29 Aug 2020 21:51:03 +0200")
References: <87mu2ddye0.fsf@dell.be.48ers.dk>
Message-ID: <873644eejj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Hi,
 > Buildroot is a simple tool for creating complete embedded Linux systems
 > (http://buildroot.org).

 > Buildroot 2020.02.5 is released - Go download it at:

 > http://buildroot.org/downloads/buildroot-2020.02.5.tar.gz

 > or

 > http://buildroot.org/downloads/buildroot-2020.02.5.tar.bz2

As pointed out by Fran?ois Perrad, this is unfortunately broken for
systemd builds without less :/

It is now fixed on the 2020.02.x branch. Please pull those fixes if you
are affected, or wait until next week when I will release 2020.02.6.

Sorry.

-- 
Bye, Peter Korsgaard
