From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 18:34:15 +0200
Subject: [Buildroot] [PATCH 1/9] iMX6S-PICO: add default config file
 (imx6spico_defconfig)
In-Reply-To: <20171011151405.3fd491f9@windsurf.lan>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
 <20171011151405.3fd491f9@windsurf.lan>
Message-ID: <3c72e113-5e69-ca9c-c792-1f2a6db8fdc4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 15:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 11 Oct 2017 14:19:30 +0200, Alexandre Gambier wrote:
>> Signed-off-by: Alexandre Gambier <agambier.dev@gmail.com>
> 
> Thanks for your contributions.
> 
> However, as I have written to you off list already, your patches 7/9,
> 8/9 and 9/9 will not make it to the list because they are too big.
> 
> And we anyway don't want such huge firmware files in Buildroot
> directly, as I already explained to you. Especially without a license
> file.
> 
> Can you instead work with the linux-firmware project to get those
> firmware files included? This will obviously require to have a proper
> license for them, but that would anyway be needed for you to be allowed
> to redistribute them.

 IIRC, Broadcom firmware images for access points are usually adapted to the
access point itself (with stuff like antenna positions, gain levels, etc). So it
might not be possible to include it in linux-firmware. And anyway,
linux-firmware already has an image for e.g. brcmfmac4330-sdio.bin, which I
guess is different from yours...

 Another option is to create a github repo for your firmware binaries and add a
package for it. Obviously, Broadcom's license will need to allow you to do that.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
