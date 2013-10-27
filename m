From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 12:31:30 +0100
Subject: [Buildroot] [PATCH v3 1/1] trace-cmd: use pkg-config instead of
	python-config
In-Reply-To: <52644CCE.1040307@openwide.fr> (Romain Naour's message of "Sun,
 20 Oct 2013 23:36:14 +0200")
References: <52644CCE.1040307@openwide.fr>
Message-ID: <871u37uezx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > trace-cmd use python-config to find out which headers
 > and libraries should be used to link against the Python libraries.
 > By default, python-config returns paths that are inappropriate for
 > cross-compilation.

 > This patch replaces python-config with pkg-config as a workaround.

 > Add PYTHON_VERS to build trace-cmd with python2 or python3

 > Fixes:
 > http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/

Committed, thanks. Did you send the patch upstream? If not, please try
to do so?

-- 
Bye, Peter Korsgaard
