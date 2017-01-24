From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 24 Jan 2017 10:46:32 -0200 (BRST)
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.29.1
In-Reply-To: <87mvehk18a.fsf@dell.be.48ers.dk>
References: <20170123135250.56972-1-Vincent.Riera@imgtec.com>
 <87mvehk18a.fsf@dell.be.48ers.dk>
Message-ID: <1637362373.8405549.1485261992908.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
> Cc: buildroot at buildroot.org
> Sent: Monday, January 23, 2017 5:47:17 PM
> Subject: Re: [Buildroot] [PATCH] util-linux: bump version to 2.29.1

>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
> > 0001-build-sys-prefer-pkg-config-for-ncurses.patch already included:
> >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=3f7429fd2d539c7f948f72bd829404b55ac19d9f
> > 0002-build-sys-cleanup-UL_NCURSES_CHECK.patch already included:
> >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=862326451184bb0fe9c2b2b110fcfc986f9b1734
> > 0003-build-sys-fix-compilation-with-ncurses-and-uClibc-or.patch already
> > included:
> >   http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5
> 
> Do we then still need _AUTORECONF = yes and the MKINSTALLDIRS workaround
> at the bottom of the .mk?

I confirmed that both util-linux and host-util-linux build successfully without _AUTORECONF = yes and the MKINSTALLDIRS workaround.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
