From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 23 Feb 2010 10:01:57 +0100
Subject: [Buildroot] [PATCH 1/1] Add patch to fix uClibc build failure
 with locale enabled
In-Reply-To: <87pr442m2h.fsf@macbook.be.48ers.dk>
References: <cover.1266060467.git.thomas.petazzoni@free-electrons.com>	<cover.1266060467.git.thomas.petazzoni@free-electrons.com>	<2bf5840e578bf5ac8245f6ce27eb395acdbfd805.1266060467.git.thomas.petazzoni@free-electrons.com>
	<87pr442m2h.fsf@macbook.be.48ers.dk>
Message-ID: <4B839985.8050100@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard a ?crit :
>
> Thanks. Aything else in the stable branch we should take? Bernhard
> mentioned that the ETA for 0.9.30.3 was ~2 weeks, so we might end up
> releasing 2010.02 before then.
>   
I would recommend to also take this one:
http://git.uclibc.org/uClibc/commit/?id=779c35b7c4e47d9fc8f69ee582e822a2f6f45411

Regards,
Julien
