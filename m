From: Stefan Schake <caytchen@gmail.com>
Date: Tue, 12 Jan 2010 12:58:38 +0100
Subject: [Buildroot] Application package cross linked to package
	libraries problem
In-Reply-To: <4B4C603A.70104@nrl.navy.mil>
References: <4B4C603A.70104@nrl.navy.mil>
Message-ID: <e4b6ec781001120358g3202f322qa8ae8c9408d8de40@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I think it would actually be more helpful if you could tell us what
exact package you're trying to build, since linking and the like can
be done very different, all depending on the package. Most of the time
though, it should not be necessary to explicitly tell an application
where to find the libary its trying to link to.

Greetings

2010/1/12 Chris Robson <Chris.Robson@nrl.navy.mil>:
>
> I'm looking for an example of how to package cross link to package
> libraries. ?That is a package which is a library and then another package
> that links to that library. ?I've built a package library with success (to
> include runtime install) and compiled a package application but getting the
> package application to link against the new package library is not working.
> ?Obviously its a path issue but an example might help me see what is wrong
> with my setup.
>
> Thanks....Chris
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
