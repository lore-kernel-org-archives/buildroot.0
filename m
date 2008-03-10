From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 13:24:49 +0100
Subject: [Buildroot] make source fails
In-Reply-To: <f90898420803100259u1e2cb011gd2536eea662f3ef7@mail.gmail.com>
	(Simon Pasch's message of "Mon\, 10 Mar 2008 10\:59\:49 +0100")
References: <f90898420803100259u1e2cb011gd2536eea662f3ef7@mail.gmail.com>
Message-ID: <873aqy7omm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Pasch <fpasch@googlemail.com> writes:

 Simon> "make source" fails, because busybox-Makefile contains a wrong
 Simon> dependency (BUSYBOX_CONFIG_FILE)

That file (E.G. package/busybox/busybox-*.config) should normally
exist - But ok, it's not needed for downloading the sources.

 Simon> This patch removes the dependency from target busybox-source.

Applied.

-- 
Bye, Peter Korsgaard
