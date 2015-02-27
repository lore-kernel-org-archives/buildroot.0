From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 17:19:43 +0100
Subject: [Buildroot] [PATCH 2/7] libxmlrpc: add missing braces for
	variable CURL_CONFIG in patch 4
In-Reply-To: <1425028764-1146-3-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:19 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <874mq71g4g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Change $CURL_CONFIG to $(CURL_CONFIG) in the patch
 > 0004-use-correct-curl-config.patch because in a makefile the braces are
 > required to expand a variable.

 > Fix error messages:
 > make[3]: Entering directory '/home/tetsuya/buildroot/br2/output/build/libxmlrpc-1.25.30/lib/curl_transport'
 > make[3]: URL_CONFIG: Command not found
 > /bin/sh: line 0: test: <: unary operator expected
 > make[3]: URL_CONFIG: Command not found

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
