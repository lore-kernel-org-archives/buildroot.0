From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Mar 2009 16:19:05 +0100
Subject: [Buildroot] error when building screen
In-Reply-To: <22289100.post@talk.nabble.com> (Mirek's message of "Mon\,
	2 Mar 2009 06\:28\:05 -0800 \(PST\)")
References: <22289100.post@talk.nabble.com>
Message-ID: <87k578j6l2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirek23" == Mirek23  <miroslaw.dach@psi.ch> writes:

 Mirek23> Dear All,

 Mirek23> I am trying to build buildroot toolchain for mips architecture. I have
 Mirek23> configured buildroot to include screen program. Unfortunately when building
 Mirek23> the executables and libraries I have got an error:

The tar version you have installed on your host doesn't seem to
support either --strip-path or --strip-components. What version are
you using?

Please post output of:

tar --version

and

tar --help|grep strip-

-- 
Bye, Peter Korsgaard
