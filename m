From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 15:16:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-08
In-Reply-To: <20170710144340.4fab6bd4@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 10 Jul 2017 14:43:40 +0200")
References: <20170709063052.6F78221DB3@mail.free-electrons.com>
 <480602992.4326585.1499689836292.JavaMail.zimbra@datacom.ind.br>
 <20170710144340.4fab6bd4@windsurf.lan>
Message-ID: <87lgnwtoth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Build failures related to your packages:
 >> > 
 >> >    mips64el |           host-util-linux-2.30 |
 >> >    http://autobuild.buildroot.net/results/a0096eb6e65b83b2b0c7d38e5f978c3fe636cb30  
 >> 
 >> Segfault in /bin/bash. Does not seem to be related to the package.

 > This is happening on Peter's autobuilder instance. It failed twice:
 > http://autobuild.buildroot.net/?reason=host-util-linux-2.30. One time
 > due to an Illegal instruction, second time due to a Segmentation fault.

 > Peter ? :-)

Sorry, no idea. gcc68 is a new Ryzen based machine in the compile farm
that I recently started an autobuilder instance on:

https://cfarm.tetaneutral.net/machines/list/

I'll try to reproduce manually and have a closer look tonight.

-- 
Bye, Peter Korsgaard
