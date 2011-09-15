From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 15 Sep 2011 11:40:57 +0100
Subject: [Buildroot] [buildroot-avr32] Host / Target system types
In-Reply-To: <4E71CD60.1010609@mimc.co.uk>
References: <4E71CD60.1010609@mimc.co.uk>
Message-ID: <4E71D639.2020808@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/09/11 11:03, Mark Jackson wrote:
> I have just cloned the latest git master and successfully compiled buildroot for my AVR32 target.
> 
> But I have noticed a slight (annoying) change ... the "target system type" used to be "avr32-linux-"
> and it's now changed to "avr32-unknown-linux-".

Okay ... looks like the default directory where these are stored has now changed, so my PATH was
wrong.  The "avr32-linux-" fiels are all symlinked to the "avr32-unknown-linux-" equivalents.

Sorry for the noise.

Mark
