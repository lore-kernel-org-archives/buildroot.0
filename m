From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 13:27:17 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <20090430122341.086c8b4a@hcegtvedt.norway.atmel.com>
	(Hans-Christian Egtvedt's message of "Thu\,
	30 Apr 2009 12\:23\:41 +0200")
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
	<87bpqebgmv.fsf@macbook.be.48ers.dk>
	<20090430122341.086c8b4a@hcegtvedt.norway.atmel.com>
Message-ID: <873abqbcve.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 >> So it's a known issue? Who's working on it? I didn't notice it on the
 >> u-boot list (I only skim that list, so that might be why though).
 >> 

 Hans-Christian> Yes, it was reported initially as

 Hans-Christian> Subject: JFFS2 scanning bug

 Hans-Christian> Then

 Hans-Christian> Subject: [PATCH 1/1] Fix JFFS2 NOR sector size routine

Ok, the followup mail apparently never got sent and the fix isn't in
git.

Thiago, could you try the fix?

http://article.gmane.org/gmane.comp.boot-loaders.u-boot/55789

 Hans-Christian> And anything which propagated from that. I did not
 Hans-Christian> stick around to see the final conclusion.

 Hans-Christian> At least make 2008.10 available, and lets hope
 Hans-Christian> 2009.05 can make us dump all the previous ones.
 >> 
 >> Or alternatively backport the fix to 2009.03 so we don't end up with 4
 >> versions (8/10, 9/1, 9/3 and 9/5).
 >> 

 Hans-Christian> Mmm, 2009.05 will hopefully be nice and flying.

Well, the affected people can hope or do the work to make sure it will
be.

-- 
Bye, Peter Korsgaard
