From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 5 Aug 2009 16:44:30 +0200
Subject: [Buildroot] Issue using an external toolchain
In-Reply-To: <873a86nxap.fsf@macbook.be.48ers.dk>
References: <c8515bdc0908050628h28decb57nd2f7456c61999f40@mail.gmail.com>
	<87bpmunzbh.fsf@macbook.be.48ers.dk>
	<c8515bdc0908050706y65cb1f8ci8fe42c3f49cd078c@mail.gmail.com>
	<873a86nxap.fsf@macbook.be.48ers.dk>
Message-ID: <c8515bdc0908050744n31131a32n89487eff61b4b418@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry. I did not realize I had not copied the buildroot list.

To answer your questions, I am booting from flash. I have not verified the
permissions, may be I should do that.
I'll check that and come back to you.

I'll also play around with the hard and soft float option in buildroot to
see if it makes a difference.

FYI, I am using buildroot.2009-02.

Gilles

2009/8/5 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:
>
>  Gilles> Hi Peter,
>  Gilles> Thanks for your help.
>
> You're welcome. Please keep the buildroot list in the to: so other
> people can also help/learn.
>
>  Gilles> FYI, it really asks for a password as shown below (output of my
> console):
>
>  Gilles> Welcome to Buildroot
>  Gilles> (none) login: root
>  Gilles> Password:
>  Gilles> Login incorrect
>
> Is this booting from flash or NFS? Have you verified the permissions
> of /etc/passwd / /etc/shadow and the /dev device nodes?
>
>  Gilles> It takes a few seconds before coming back to me saying "login
>  Gilles> incorrect"
>
>  Gilles> I do not know if the toolchain is configured for hard or
>  Gilles> softfloat. Is this important?
>
> Yes it is.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090805/bad6cb21/attachment.htm>
