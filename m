From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jan 2013 22:08:29 +0100
Subject: [Buildroot] [PATCH 1/3] system/skeleton: add the shadow-group
	file
In-Reply-To: <201301011636.05672.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 1 Jan 2013 16:36:05 +0100")
References: <cover.1356909238.git.yann.morin.1998@free.fr>
 <201212311918.08866.yann.morin.1998@free.fr>
 <20130101102606.258d780e@skate>
 <201301011636.05672.yann.morin.1998@free.fr>
Message-ID: <87k3rwsjaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> The next question that comes up is: do we really need to support this
 >> in Buildroot?

 Yann> Well, I interpreted the abscence of that file as an oversight,
 Yann> that's why I thought of adding it.

 Yann> Right, we probably do not need the change-group feature in
 Yann> buildroot.  However, for the sake of consistency, I think it is
 Yann> good to have gshadow.

 Yann> But I can very well live without it, sure.

Well, the fact that nobody has ever asked for it in the 11 years
buildroot has existed and that Thomas (and me) didn't know about the
file, makes me think that perhaps it isn't too important to support it
in the default skeleton (you can certainly manually add it).

 Yann> Anyway... Happy New Year to all! :-)

Thanks, same to you!

-- 
Bye, Peter Korsgaard
