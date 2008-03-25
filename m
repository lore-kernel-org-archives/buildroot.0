From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 25 Mar 2008 08:12:19 +0100
Subject: [Buildroot] [BR-AVR32] Re:  Shell-Weirdness
In-Reply-To: <46a136670803201032p55b8aa2dx91dd48fae97c79a3@mail.gmail.com>
References: <1206018367.6470.7.camel@luder>
	<46a136670803201005o355c88a0jf50936b9a27fd36f@mail.gmail.com>
	<1206033001.2562.45.camel@nigel-x60>
	<1206033139.2562.48.camel@nigel-x60>
	<46a136670803201032p55b8aa2dx91dd48fae97c79a3@mail.gmail.com>
Message-ID: <1206429139.19642.12.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-03-20 at 13:32 -0400, John Voltz wrote:
> Wow. That stinks. I'll forward this message to the Atmel guys and see
> if they have any idea what to do to maybe fix this.
> 

The AVR32 patches for GCC (and Binutils) are vendor specific so I would
not recommend applying them to other architectures.

That is also one of the reasons it is better for the time being to
separate out the AVR32 specific stuff from Buildroot in a separate
branch.

When time comes, and stuff is properly merged, there should be very
little difference between upstream and the AVR32 branch.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
