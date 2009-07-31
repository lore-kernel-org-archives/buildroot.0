From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Jul 2009 11:52:19 +0200
Subject: [Buildroot] no fontconfig in $(TARGET_DIR)
In-Reply-To: <4A72BD91.7040703@fpga-art.de> (Lars Lockenvitz's message of
	"Fri\, 31 Jul 2009 11\:46\:57 +0200")
References: <4A71A8C8.5030409@fpga-art.de>
	<87hbwtwcdy.fsf@macbook.be.48ers.dk> <4A72BD91.7040703@fpga-art.de>
Message-ID: <87k51puqlo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lars" == Lars Lockenvitz <l.lockenvitz@fpga-art.de> writes:

Hi,

 >> What happens if you delete that file and rerun make?
 >> 
 Lars> If I delete that file and rerun make it install it in target_dir.
 Lars> But I tried to create all from the beginning and now I have it in
 Lars> target_dir but not in staging_dir and I don't have a
 Lars> .stamp_staging_installed.
 Lars> Why that now?

Hmm, I don't quite know. You don't use the -j option to make, do you?

How did you do a fresh rebuild (rm -rf *build_*; make)?

Could you retry with latest git and check if you still see the problem?

-- 
Bye, Peter Korsgaard
