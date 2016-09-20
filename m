From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 14:31:09 +0200
Subject: [Buildroot] [PATCH v2] supertuxkart: Constrain to x86
	architecture
In-Reply-To: <20160902142103.1661-1-ezequiel@vanguardiasur.com.ar> (Ezequiel
 Garcia's message of "Fri, 2 Sep 2016 11:21:03 -0300")
References: <20160902142103.1661-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <87fuou3g8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Our build system has detected that angelscript can't be
 > cross-compiled properly. This has been also reported to
 > supertuxkart [1], and although the developers were open
 > to take patches fixing STK embedded angelscript, it was
 > pointed out that non-x86 architectures were not officially
 > supported and of little interest [2].

 > Hence, let's constrain the package selection and the host
 > architecture to x86.

 > [1] https://github.com/supertuxkart/stk-code/issues/2569
 > [2] https://github.com/supertuxkart/stk-code/pull/2195

 > Fixes: http://autobuild.buildroot.net/results/655/655f046b3bb5f7a4ea492328b608e409d6769689/
 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > ---
 > Changes from v1:

 >   * As pointed out by Thomas, we also need to limit
 >     the host architecture, as angelscript doesn't seem
 >     to build elsewhere.

Committed, thanks.

-- 
Bye, Peter Korsgaard
