From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 15:56:18 +0100
Subject: [Buildroot] Duplication and size of binaries in generated
	toolchain
In-Reply-To: <20090305154750.0ff0c0aa@surf> (Thomas Petazzoni's message of
	"Thu\, 5 Mar 2009 15\:47\:50 +0100")
References: <20090305151359.20b37039@surf>
	<878wnkf3r7.fsf@macbook.be.48ers.dk> <20090305154750.0ff0c0aa@surf>
Message-ID: <87zlg0dnn1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> They are hard links to the same file:

 Thomas> Ok, I missed that. But why are they needed in the first place ?

They are not really needed for us, but gcc afaik creates them
automatically for cross compilers.

-- 
Bye, Peter Korsgaard
