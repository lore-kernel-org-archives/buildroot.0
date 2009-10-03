From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Oct 2009 19:02:32 +0200
Subject: [Buildroot] Conflicting types for getline
In-Reply-To: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C4@EXCHANGE31.staff.main.ntu.edu.sg>
	(Teng Chee Wan Philip's message of "Sat\,
	3 Oct 2009 21\:48\:02 +0800")
References: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C3@EXCHANGE31.staff.main.ntu.edu.sg>
	<7085C89ACBD47E4B947F91A84B9EA9240C1CF914C4@EXCHANGE31.staff.main.ntu.edu.sg>
Message-ID: <87ljjs5s2f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Teng" == Teng Chee Wan Philip <tcheewan@ntu.edu.sg> writes:

 Teng> Hi,
 Teng> I encountered an error running make for buildroot.  Any ideas?  Thanks in advance.

That's a known problem when you try to use older Linux kernels on new
distributions. Select a newer version (>2.6.28) for the Linux kernel
headers and it should work.

-- 
Bye, Peter Korsgaard
