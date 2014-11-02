From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 22:49:19 +0100
Subject: [Buildroot] [PATCH v2] unzip: Use the "-q" option to silence
	unzipping of source files
In-Reply-To: <1414574321-16399-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Wed, 29 Oct 2014 10:18:41 +0100")
References: <1414574321-16399-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87vbmx46jk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Add and use the "UNZIP" variable instead of calling directly unzip
 > because the variable contains the "-q" option to silence "unzip" so it
 > doesn't show the list of files extracted just like when tar files are
 > being unpacked.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---

 > Notes:
 >     v2:
 >      - remove the "-d" option from the "UNZIP" variable (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
