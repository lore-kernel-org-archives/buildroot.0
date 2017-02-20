From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:40:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-02-16
In-Reply-To: <20170220134111.1bc02a9f@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 20 Feb 2017 13:41:11 +0100")
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
Message-ID: <87a89gpjtk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> >       x86_64 | oracle-mysql-5.1.73 | NOK |
 >> > http://autobuild.buildroot.net/results/e9ff38bea523df79331de3004939ee39b446d723
 >> 
 >> error: narrowing conversion [...] from 'char' to 'uchar...'
 >> 
 >> Damn gcc6... ;-) Should be easy; any taker?

 > I had a quick look, it's not that trivial if you want the correct fix.
 > And of course, mysql 5.1.73 is very very old, upstream is now at 5.7.17
 > (https://dev.mysql.com/downloads/mysql/). So I would like to suggest
 > that we mark oracle-mysql as BR2_BROKEN, and wait to see if anyone is
 > interested to fix this during the next release cycle.

I agree. There has also recently been some security issues, but like you
say our package is ancient.

Will you send a patch?

-- 
Bye, Peter Korsgaard
