From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Feb 2010 13:29:29 +0100
Subject: [Buildroot] [PATCH 1/1] Add patch to fix uClibc build failure
	with locale enabled
In-Reply-To: <4B839985.8050100@free.fr> (Julien Boibessot's message of "Tue,
	23 Feb 2010 10:01:57 +0100")
References: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<cover.1266060467.git.thomas.petazzoni@free-electrons.com>
	<2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
	<87pr442m2h.fsf@macbook.be.48ers.dk> <4B839985.8050100@free.fr>
Message-ID: <878wakf846.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

 Julien> Hi Peter,
 Julien> Peter Korsgaard a ?crit :
 >> 
 >> Thanks. Aything else in the stable branch we should take? Bernhard
 >> mentioned that the ETA for 0.9.30.3 was ~2 weeks, so we might end up
 >> releasing 2010.02 before then.
 >> 
 Julien> I would recommend to also take this one:
 Julien> http://git.uclibc.org/uClibc/commit/?id=779c35b7c4e47d9fc8f69ee582e822a2f6f45411

Hmm, that one isn't on the stable branch and doesn't apply cleanly to it
as is. It would be good if you could work with the uclibc guys
(E.G. Bernhard) to get it in 0.9.30.3 if needed.

-- 
Bye, Peter Korsgaard
