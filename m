From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:11:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] toolchain: bump Codescape IMG MIPS
	version to 2016.05-06
In-Reply-To: <20170113175501.38416-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 13 Jan 2017 17:55:00 +0000")
References: <20170113175501.38416-1-Vincent.Riera@imgtec.com>
Message-ID: <87inpffblh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Also...
 > - Fix a typo in Config.in
 > - Take into account the host's architecture to download the x86 or
 >   x86_64 version. This makes the IA32 libs dependency in unnecessary.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix a typo in Config.in
 >  - Take into account the host's architecture to download the x86 or
 >    x86_64 version. Remove IA32 libs dependency.

Committed both after fixing the kernel headers version comment as
pointed out by Romain, thanks.

-- 
Bye, Peter Korsgaard
