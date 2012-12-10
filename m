From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 10:40:24 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: bumpimg default
	GCC version to 4.6.3
In-Reply-To: <20121210100945.0ccfbe69@skate> (Thomas Petazzoni's message of
 "Mon, 10 Dec 2012 10:09:45 +0100")
References: <20121209203933.44D7B9A158@busybox.osuosl.org>
 <20121210100945.0ccfbe69@skate>
Message-ID: <87ehiytfcn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The recent updates to the crosstool-ng configs is apparently breaking
 Thomas> the build:

 Thomas>   http://autobuild.buildroot.org/results/b99c757884d14bbe8893900824763f63dd13f5dc/build-end.log

Yes, that looks related (but not exactly the same) as the ppl issues
with gcc 4.7+ mentioned yesterday.

Yann mentioned on IRC that he had a ppl fix pending.

-- 
Bye, Peter Korsgaard
