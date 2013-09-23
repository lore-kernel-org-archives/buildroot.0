From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Sep 2013 09:34:54 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/wrapper: add option to print
	one argument per line
In-Reply-To: <31f4ddb9ea718e4bb9321ffb8bf5d75f5fb02361.1379714259.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 21 Sep 2013 00:00:30 +0200")
References: <cover.1379714259.git.yann.morin.1998@free.fr>
 <cover.1379714259.git.yann.morin.1998@free.fr>
 <31f4ddb9ea718e4bb9321ffb8bf5d75f5fb02361.1379714259.git.yann.morin.1998@free.fr>
Message-ID: <87mwn49ejl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> In case there are many arguments passed to the tools, the command line
 Yann> can get very long, and difficult to parse visually.

 Yann> For example, the Linux kernel passes a lot of arguments to gcc (at least
 Yann> 45, which gives 53 with our hard-coded args). Looking at such a command
 Yann> line is daunting.

 Yann> So, add the possibility to print each argument on its own line.

 Yann> Also, enclose all args between single quotes, so the command line
 Yann> can be safely copy-pasted without special chars (spaces, $) being
 Yann> inrerpreted by the shell.

 Yann> Add blurb about toolchain-wrapper to documentation at the same
 Yann> time.

Committed with minor code style changes, thanks.

-- 
Bye, Peter Korsgaard
