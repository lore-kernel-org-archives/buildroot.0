From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Apr 2015 00:28:32 +0200
Subject: [Buildroot] [PATCHv2] Makefile: add list-defconfig to the
	general help
In-Reply-To: <1429823046-8906-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 23 Apr 2015 23:04:06 +0200")
References: <1429823046-8906-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877ft2scmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When listing defconfig files was moved to its own make target, it was
 > not added to the general help text.

 > However, this is a very important topic, so list it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - move to the 'documentation' section  (Arnout)

 > diff --git a/Makefile b/Makefile
 > index 5de4789..f37d17e 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -886,6 +886,7 @@ endif
 >  	@echo '  manual-epub            - build manual in ePub'
 >  	@echo '  graph-build            - generate graphs of the build times'
 >  	@echo '  graph-depends          - generate graph of the dependency tree'
 > +	@echo '  list-defconfigs:       - list all defconfigs (pre-configured minimal systems)'

I've dropped the ':' character to match the other lines and committed,
thanks.

-- 
Bye, Peter Korsgaard
