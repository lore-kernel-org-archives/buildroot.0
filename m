From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 14:09:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-04
In-Reply-To: <4FCDE2F4.4080502@lucaceresoli.net> (Luca Ceresoli's message of
 "Tue, 05 Jun 2012 12:44:04 +0200")
References: <20120605063154.64FC752CF4D@lolut.humanoidz.org>
 <4FCDE2F4.4080502@lucaceresoli.net>
Message-ID: <87mx4iot8z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 Luca> I don't have the toolchains to reproduce these exactly, but "OBJCLD"
 Luca> seems a good hint.

 Luca> However, I bet simply adding --disable-tests is a much simpler
 Luca> solution. I'm sending a
 Luca> patch to do this. Thomas, would you please test with the same config?

 Luca> As for me, I checked with the default BR toolchain and no "OBJCLD" is
 Luca> output anymore while
 Luca> building mediastreamer.

Thanks. I guess it is because of the macosx specific (optional) sources,
similar to the recent problem with pulseaudio. Strangely enough, I
haven't seen this problem here during testing.

-- 
Bye, Peter Korsgaard
