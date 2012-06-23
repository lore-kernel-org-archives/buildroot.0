From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Jun 2012 21:53:51 +0200
Subject: [Buildroot] [PATCH] xinetd: explicitly specify AR in build step
In-Reply-To: <1340068712-10822-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 18 Jun 2012 21:18:32 -0400")
References: <1340068712-10822-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <877guxdcts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> xinetd's configure does not set up an AR variable, and there
 Danomi> are no libtool files to autoreconfigure.  So instead, lets
 Danomi> pass in AR during the build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
