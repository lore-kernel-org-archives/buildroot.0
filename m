From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Oct 2013 15:05:35 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <20131011142235.1b446183@skate> (Thomas Petazzoni's message of
 "Fri, 11 Oct 2013 14:22:35 +0200")
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
 <20131011112938.16a751d7@skate> <878uy0un36.fsf@dell.be.48ers.dk>
 <20131011122355.791e8810@skate>
 <CAAXf6LVKr0DPT1U2GuTqdSGAyMGEAdDGF6Uo0PYeb4gGLmg9wQ@mail.gmail.com>
 <874n8ouivj.fsf@dell.be.48ers.dk> <20131011141119.7d87610d@skate>
 <CAAXf6LU22crjgist0QpFxAGP=DECKjzRj-+2xccBgyxDtWTUfA@mail.gmail.com>
 <20131011142235.1b446183@skate>
Message-ID: <87zjqgt0tc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> If a user wants to stick to a given eglibc and gcc version, and Linaro
 >> updates eglibc without updating gcc, then that user will have to do
 >> something special. I think it's not realistic for us to handle this in
 >> a clearer way than Linaro does, except by providing a 'custom version'
 >> option.

 Thomas> Ok. From an user perspective, I'm not quite convinced that it
 Thomas> makes more sense to index according to the gcc release than the
 Thomas> binutils, gdb, or eglibc version, or the EABI, or something
 Thomas> else, but ok, fair enough.

Well, I would argue that the gcc version in general is more important /
has higher impact than the binutils or gdb versions. hard/softfloat
means seperate toolchains (or multilib), so that leaves the eglibc
version.

I agree that ignoring the eglibc version is probably good enough.

-- 
Bye, Peter Korsgaard
