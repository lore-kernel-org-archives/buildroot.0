From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 23:04:48 +0200
Subject: [Buildroot] [PATCH v2,1/1] gnuchess: needs -fPIC
In-Reply-To: <20190623202308.536031c8@windsurf> (Thomas Petazzoni's message of
 "Sun, 23 Jun 2019 20:23:08 +0200")
References: <20190112175505.14348-1-fontaine.fabrice@gmail.com>
 <20190113141329.4d526438@windsurf.home>
 <20190623202308.536031c8@windsurf>
Message-ID: <87pnn1gyvj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Therefore I guess the issue is in elf2flt, and I reported a bug at
 > https://github.com/uclinux-dev/elf2flt/issues/11.

Thanks.

 > In the mean time, I'm not sure what to do. Indeed, we don't care about
 > gnuchess on Cortex-M, but the same issue affects building binutils,
 > which may be a bit more important (for libbfd).

 > Should we simply add a work-around in gnuchess, to build in -O0 for the
 > time being ?

You mean for gnuchess AND for binutils? I guess so.

-- 
Bye, Peter Korsgaard
