From: Andreas Naumann <dev@andin.de>
Date: Mon, 10 Feb 2014 12:31:08 +0100
Subject: [Buildroot] Antw: build speedup possible?
In-Reply-To: <20140207174355.383b6bb3@skate>
References: <52F49E9D.2020506@andin.de>
 <52F4AEC7020000460004A4EE@gwia2.rz.hs-offenburg.de>
 <CAHXCMMJD_i9aQtFkxWD_tPbpdJd_-Gv_zkC0KxnEtRoQO=7Vug@mail.gmail.com>
 <CAHkwnC_B8RRAXBOGjjpr2X7CbZpVTnsDx8QoLEPfaieEoSd4gA@mail.gmail.com>
 <20140207162934.01acfe5a@skate>
 <CAHkwnC-pAGs0DCu80X3_AQgrsxcOO82GMY7NwmegxT6V0_kwJw@mail.gmail.com>
 <20140207174355.383b6bb3@skate>
Message-ID: <52F8B87C.4070201@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 07.02.2014 17:43, schrieb Thomas Petazzoni:

>
> If we want to get this to the next level, someone need to experiment
> with per-package sysroot. Of course, this would be a long experiment,
> without necessarily at the end the guarantee that we will accept it,
> because it may be too complex to match Buildroot simplicity principle.
>

as I said, we have hacked br to a per-package sysroot in the past. This 
was in order to create isolated ipkgs and did its job. Even if we dont 
solve any of the dependency issues with that, it could be a starting 
point. If this is of  interest I can try to go further with it.

And for the depency issue, how does OE solve it?


cheers,
Andreas



> Best regards,
>
> Thomas
>
