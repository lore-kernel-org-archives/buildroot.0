From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 23:16:04 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem-export-vars
In-Reply-To: <cover.1358113846.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 13 Jan 2013 22:52:19 +0100")
References: <cover.1358113846.git.yann.morin.1998@free.fr>
Message-ID: <8738y4vie3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!
 Yann> This series introduces exporting a variable, $(BUILDROOT_CONFIG), that
 Yann> contains the fully-qualified path to out .config.

 Yann> In some cases, scripts in support/ need to parse our .config (eg. the
 Yann> dependency-checking script needs to check the conformity of rxternal
 Yann> toolchain features).

 Yann> Also, some Makefile fragments (eg. the crosstool-Ng backend) need to
 Yann> refer to this config file for make-dependency-checking.

 Yann> This was currently done in different ad-hoc manners, and is not scalable.

 Yann> I'll also use it later to retrieve the password encoding scheme when
 Yann> creating users from packages.

 Yann> Changes v1 -> v2:
 Yann>   - rename BR2_CONFIG_FILE -> BUILDROOT_CONFIG (Arnout)
 Yann>   - use $(BUILDROOT_CONFIG) in top-level Makefile, too (Arnout)

Committed series, thanks.

-- 
Bye, Peter Korsgaard
