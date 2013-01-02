From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jan 2013 20:36:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	graph-depends-improvements
In-Reply-To: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 2 Jan 2013 18:08:47 +0100")
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87txqzpeba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here are a few improvements to the graph-depends script. The most
 Thomas> important improvements are:

 Thomas>  * Removal of useless dependencies for the meta "all" package to many
 Thomas>    packages. This makes the dependency graphs a lot more readable.

 Thomas>  * Drastic optimization of the execution speed: on a given
 Thomas>    configuration, it used to take 5 minutes 14 seconds to generate the
 Thomas>    graph, now it takes 33 seconds.

Nice! Committed, thanks.

-- 
Bye, Peter Korsgaard
