From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 21:47:22 +0200
Subject: [Buildroot] [PATCH] gcc: enable _REENTRANT for bfin when
	-lpthread is used
In-Reply-To: <20161001095947.GA26848@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 1 Oct 2016 11:59:47 +0200")
References: <20161001095947.GA26848@waldemar-brodkorb.de>
Message-ID: <87wphqo7n9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See here, why this should be always enabled:
 > https://lists.gnu.org/archive/html/autoconf-archive-maintainers/2016-06/msg00001.html

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > This might be a good addition to the patch series for gcc bfin,
 > which Thomas Petazzoni is handling :)

Committed, thanks. Please also submit the change to upstream gcc.

-- 
Bye, Peter Korsgaard
