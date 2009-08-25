From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 25 Aug 2009 12:44:44 +0200
Subject: [Buildroot] Buildroot and OpenEmbedded
In-Reply-To: <5f2b60908250214p357b20d5q1de520d50ec2c1fb@mail.gmail.com>
References: <5f2b60908130604i7175f89h533d1b8f8444e60f@mail.gmail.com>	<87skfhnd23.fsf@macbook.be.48ers.dk>
	<5f2b60908250214p357b20d5q1de520d50ec2c1fb@mail.gmail.com>
Message-ID: <4A93C09C.4020901@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn Forsman a ?crit :
> Funny, nobody has commented the "OE+BR merge" I mentioned. Am I the only one
> dreaming of a BR with its easy configuration combined with the package
> set provided
> by OE? But I guess the OE bitbake tool and *.bb files makes a merge
> impossible...

A possible way: Make the BR configuration tool generate the 
corresponding OE configuration for the BR supported subsets.

A better way: Create a sweet OE configuration tool, capable to make BR 
obsolete in term of user experience and system performance (size, speed, 
etc...)

In the long term, even OE will face concurrence from even better concept 
more closely related to the main current distributions. Such candidates 
could be EmDebian or the future Debian Multiarch. ScratchBox have gain 
more and more attention too.

Too many tools fragment the community. I also think that merging the 
bests features from projects with very similar goal will be a benefit 
for everyone in the long term.

Jean-Christian de Rivaz
