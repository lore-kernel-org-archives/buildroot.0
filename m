From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 09:27:47 +0100
Subject: [Buildroot] [PATCH 1/1] gengetopt: add patch to fix compilation
	warnings in generated code
In-Reply-To: <20170203220248.5515-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 3 Feb 2017 23:02:48 +0100")
References: <20170203220248.5515-1-patrickdepinguin@gmail.com>
Message-ID: <87shnuz7gc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > getgetopt generates code that causes compilation warnings in current
 > versions of gcc. If gengetopt is used for programs that set -Werror during
 > compilation, these compilation warnings become real problems.

 > Unfortunately, the gengetopt project seems dead for several years now. Last
 > release dates back to 2012. There is an open bug for this problem [1], with
 > a proposed patch, but no response from the maintainers.

 > Apply the patch from the bug report to fix the problem.

 > [1]  http://savannah.gnu.org/bugs/?40243

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
