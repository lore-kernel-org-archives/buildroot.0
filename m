From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:31:54 +0200
Subject: [Buildroot] [PATCH] ci20_defconfig: disable madd instructions
	to avoid FPU bug
In-Reply-To: <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com> (Vicente
 Olivert Riera's message of "Wed, 19 Oct 2016 09:47:03 +0100")
References: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
 <20161018145413.37ae0751@free-electrons.com>
 <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com>
Message-ID: <87a8e0elbp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 >> Note: this is *really* a question. I am not sure we want to make such a
 >> change to the MIPS CPU selection.

 > We could add an Ingenic XBurst entry in the MIPS CPU selection, and then
 > add that -mno-fused-madd option to the wrapper based on that selection.

 > If you are OK with that, please let me know and I'll cook the patch.

Yes, I believe this is the way we want to move forward.

-- 
Bye, Peter Korsgaard
