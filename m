From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 23:02:38 +0200
Subject: [Buildroot] Discussing libudev,
 was: Re: [PATCH v6 09/32] mesa3d: dri2 does not need udev support
In-Reply-To: <pil74bx9op.ln2@ID-313208.user.individual.net>
References: <pil74bx9op.ln2@ID-313208.user.individual.net>
Message-ID: <20140512230238.76c7fb6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 12 May 2014 21:55:37 +0200, Bernd Kuhls wrote:

> This was an interesting piece of information for me because I am patching 
> xbmc to remove its libudev dependency in the cec-adapter detection part.
> While trying to setup Emil?s suggestion I created a libudev package which 
> was successfully linked by libcec and its binary cec-client to detect my 
> cec adapter so I guess Emil?s idea could really work.
> 
> I have yet to do more testing but reading through the udev/systemd/eudev 
> discussion of the last months here I would like to ask for feedback already 
> at this early stage whether a seperate libudev package is useful for the 
> broader public.

What would be the upstream source for this libudev package?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
