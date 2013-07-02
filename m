From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 23:43:02 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <20130702071112.d2bed52344e1786c14494b36@lavabit.com> (rh's
 message of "Tue, 2 Jul 2013 07:11:12 -0700")
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com> <51D26E29.6030805@mind.be>
 <20130702093415.5db13282@skate>
 <20130702071112.d2bed52344e1786c14494b36@lavabit.com>
Message-ID: <87d2r0sknt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "rh" == rh  <richard_hubbe11@lavabit.com> writes:

 rh> On Tue, 2 Jul 2013 09:34:15 +0200
 rh> Thomas Petazzoni <thomas.petazzoni-wi1
 rh> +55ScJUtKEb57/3fJTNBPR1lH4CV8 at public.gmane.org> wrote:

 rh> --8<--

 >> To handle such a bizarre stuff, I don't see any other option that
 >> adding a new kconfig option to specify a shell script to be executed
 >> at "patch" time of the kernel, so that one can do whatever funky
 >> things (s)he wants. That's ugly, but I don't see a nice and generic
 >> way of handling such a bizarre distribution of kernel code.

 rh> It's not a good situation. 3.8 kernel is EOL and it seems that TI
 rh> has no resources to get the code upstream.

Well, things are moving - Just not always as fast as you could hope. TI
is certainly not the worst vendor, but we're not there yet for am335x.

I think the best way forward in the short term would be if somebody
would maintain a git tree containing the kernel sources and Koen's patch
set applied on top, and once in a while sync / send a patch to buildroot
to update the git revision the bbb config uses.

-- 
Bye, Peter Korsgaard
