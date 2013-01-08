From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jan 2013 08:18:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch perf-elfutils
In-Reply-To: <20130107233924.35c4d87f@skate> (Thomas Petazzoni's message of
 "Mon, 7 Jan 2013 23:39:24 +0100")
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
 <87ip78bp47.fsf@dell.be.48ers.dk> <20130107233924.35c4d87f@skate>
Message-ID: <87ehhwb0sz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Thomas, please don't forget to (try to) send these patches upstream so
 >> we don't have to maintain them ourselves in the future.

 Thomas> Which ones exactly? The big fat patches we are downloading from
 Thomas> fedorahosted.org? Our patches?

 Thomas> All our patches are really specific to uClibc support, and
 Thomas> seeing the number of glibc-isms in elfutils, I am not sure the
 Thomas> maintainers will be interested in making it uClibc
 Thomas> friendly. But it's maybe worth trying.

Our own. I would certainly say it's worth a try.

 Thomas> One nice thing that could be done is migrate the
 Thomas> linux-kernel-module.c thing to use nftw(), so we could drop the
 Thomas> fts() mess.

Indeed.

-- 
Bye, Peter Korsgaard
