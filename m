From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Mar 2017 22:31:11 +0100
Subject: [Buildroot] [PATCH] toolchain/external: use -dumpversion to
	check gcc version
In-Reply-To: <20170309214658.15ab76aa@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 9 Mar 2017 21:46:58 +0100")
References: <20170309080136.4799-1-kris@youview.com>
 <20170309212754.7118e5ac@free-electrons.com>
 <20170309214658.15ab76aa@free-electrons.com>
Message-ID: <87h932b0io.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Applied to master, thanks. I was worried that -dumpversion might have
 >> been a recent gcc option, but I found it in gcc 3.4 documentation, so
 >> we're good.

 > Peter: this commit might also be useful on the LTS, it allows the
 > external toolchain code to be more compatible with different
 > toolchains. Of course, you might want to wait a few days to see if we
 > get some feedback after it has been applied on master.

Yes, I've flagged it locally. I'll apply it this weekend if nothing
blows up in the autobuilders.

-- 
Bye, Peter Korsgaard
