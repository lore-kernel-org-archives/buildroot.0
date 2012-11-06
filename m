From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Nov 2012 08:22:57 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.11/rpc-support
In-Reply-To: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 4 Nov 2012 18:34:08 +0100")
References: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcdjnqjy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Yet another version of the RPC set of patches. Changes since the last
 Thomas> posting:

 Thomas>  * The kernel headers version chunk has been properly moved to the SH
 Thomas>    2012.03 toolchain patch. Noticed by Baruch.

 Thomas>  * Assume that by default, custom external glibc toolchains have RPC
 Thomas>    support, so that autobuilders configuration continue to work nicely
 Thomas>    (and also because it is most likely the case for most
 Thomas>    toolchains). Suggested by Peter.

Committed series, thanks.

I fixed up the getrpcby{name,number} issue as well.

-- 
Bye, Peter Korsgaard
