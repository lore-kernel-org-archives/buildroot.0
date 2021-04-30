From: Drew Fustini <drew@beagleboard.org>
Date: Fri, 30 Apr 2021 01:27:03 -0700
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210430082703.GA139460@x1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 09:46:31AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> The beta version of the Beagle-V RISC-V 64-bit platform has been
> showing up at the front door of a few lucky people around the world in
> the past days.

Thank you for getting this posted so fast! The primary goal of our beta
developer program for the BeagleV Starlight is to get the upstream
process going so we are in a good position when the production board
launches with distributors in September [1]. Anyone interested can join
our public BeagleV forum to stay updated [2].

This is the first upstream patch series for BeagleV Starlight which
made me realize I need to provide some clarification on naming guidance
for the boards and SoCs. I have added a new section to the README [3].

Small nit for this cover letter is that it should be BeagleV instead of
Beagle-V.  But more importantly I want to make everyone aware that there
there will eventually be two different BeagleV Starlight boards:

- BeagleV Starlight board with StarFive JH7100 SoC (2x SiFive U74)
- BeagleV Starlight board with StarFive JH7110 SoC (4x U74, PCIe, GPU)

The board that a limited number of beta developers like Thomas have just
received is the JH7100 version.

Thank you,
Drew Fustini
BeagleBoard.org Foundation

[1] https://github.com/beagleboard/beaglev-starlight
[2] https://forum.beagleboard.org/c/beaglev
[3] https://github.com/beagleboard/beaglev-starlight#guidance-on-naming-conventions
