From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Jun 2013 15:44:02 +0200
Subject: [Buildroot] using a variable within a buildroot menuconfig
In-Reply-To: <CANxTyt5QFrhLW__jV4+HKPGjDvvZwfh9KMcwWP1JK6bpB-oHEA@mail.gmail.com>
 (Danomi Manchego's message of "Sat, 29 Jun 2013 09:42:15 -0400")
References: <51C94D88.5080707@gmail.com> <51C9D5C5.4090409@mind.be>
 <87txkj3fl8.fsf@dell.be.48ers.dk>
 <CANxTyt5QFrhLW__jV4+HKPGjDvvZwfh9KMcwWP1JK6bpB-oHEA@mail.gmail.com>
Message-ID: <87k3ldxc9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> On Thu, Jun 27, 2013 at 8:25 AM, Peter Korsgaard?<jacmet@uclibc.org>?wrote:
 Danomi>     FYI, I'm currently looking at more-or-less the same horror, E.G. the
 Danomi>     1.6G ezsdk blob for ti81xx.

 Danomi> I too am a victim of the ti81xx EZSDK horror. ?I've been
 Danomi> compiling the EZSDK on its own, doing a "make install
 Danomi> EXEC_DIR=/some/place", and then using a script to selectively
 Danomi> pull stuff out of the created install tree into something like
 Danomi> a target skeleton overlay that gets installed into staging as
 Danomi> well. ?It works, but stinks for source control. ?(Check in the
 Danomi> whole 1.6G, most of which is worthless and takes a long time to
 Danomi> compile, or check in the resulting overlay, which feels hacky?)

Yeah, I would like to be able to clean it up enough to get it added to
mainline Buildroot, but I've only now started looking..
-- 
Bye, Peter Korsgaard
