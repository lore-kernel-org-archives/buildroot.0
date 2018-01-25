From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 08:40:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-22
In-Reply-To: <87wp08n9oo.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 23 Jan 2018 11:36:39 +0100")
References: <20180123070007.E56D620788@mail.free-electrons.com>
 <705165292.51458.1516702205725.JavaMail.zimbra@datacom.ind.br>
 <87wp08n9oo.fsf@dell.be.48ers.dk>
Message-ID: <877es6mlnb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
 >>> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
 >>> To: buildroot at buildroot.org
 >>> Sent: Tuesday, January 23, 2018 5:00:07 AM
 >>> Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-22

 >> --8<--
 >>> arc |         host-util-linux-2.31.1 | NOK |
 >>> http://autobuild.buildroot.net/results/fb2205703ee0f4be3dde95a4efc29ec8231e34bf

 >> Segfault in bash during the build. Looks like a host problem.

 > Hmm, that is not good. gcc67 is one of the Ryzen machines on the cluster
 > that had issues in the past, but I restarted the builder as I got a
 > notification that the CPUs had been replaced.

 > I'll monitor the autobuilder and stop it if it happens again.

We had a number of similar issues, so I've stopped the builder.

-- 
Bye, Peter Korsgaard
