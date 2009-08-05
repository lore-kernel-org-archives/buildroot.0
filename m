From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Aug 2009 16:35:26 +0200
Subject: [Buildroot] Issue using an external toolchain
In-Reply-To: <c8515bdc0908050706y65cb1f8ci8fe42c3f49cd078c@mail.gmail.com>
	(Gilles Talis's message of "Wed\, 5 Aug 2009 16\:06\:06 +0200")
References: <c8515bdc0908050628h28decb57nd2f7456c61999f40@mail.gmail.com>
	<87bpmunzbh.fsf@macbook.be.48ers.dk>
	<c8515bdc0908050706y65cb1f8ci8fe42c3f49cd078c@mail.gmail.com>
Message-ID: <873a86nxap.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Hi Peter,
 Gilles> Thanks for your help.

You're welcome. Please keep the buildroot list in the to: so other
people can also help/learn.

 Gilles> FYI, it really asks for a password as shown below (output of my console):

 Gilles> Welcome to Buildroot
 Gilles> (none) login: root
 Gilles> Password:
 Gilles> Login incorrect

Is this booting from flash or NFS? Have you verified the permissions
of /etc/passwd / /etc/shadow and the /dev device nodes?

 Gilles> It takes a few seconds before coming back to me saying "login
 Gilles> incorrect"

 Gilles> I do not know if the toolchain is configured for hard or
 Gilles> softfloat. Is this important?

Yes it is.

-- 
Bye, Peter Korsgaard
