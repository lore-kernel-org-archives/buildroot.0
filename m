From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:11:09 +0100
Subject: [Buildroot] [PATCH v1] package/edid-decode: bump version to
 6def7bc
In-Reply-To: <20190212205646.31071-1-ps.report@gmx.net>
References: <20190212205646.31071-1-ps.report@gmx.net>
Message-ID: <20190215221109.0b7c3b34@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Feb 2019 21:56:46 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Changes since f56f329:
> 
>   0a454bc makefile: also honor LDFLAGS
>   9e59ba9 edid-decode: update links, add README
>   7684918 edid-decode: README: updates
>   bc1e846 edid-decode: reformat to linux kernel coding style
>   9cb3744 edid-decode: fix spurious warning about string termination
>   3b26b8a edid-decode: fix wrong sample rate unit
>   4437dd9 edid-decode: use const for unsigned char pointers to the EDID
>   eee377b edid-decode: add support for QuantumData 980 EDID file format
>   7d8f41f edid-decode: simplify data block parsing
>   8c81ccf Add Samsung UE49KS8005 EDID
>   ab18bef edid-decode: add HDMI Forum VSDB fields for HDMI 2.1b
>   e9ffafc edid-decode: add options and new output formats
>   b2da151 edid-decode: add --extract and --check options
>   5eeb151 edid-decode: replace AdobeYCC/RGB by opYCC/RGB
>   6def7bc edid-decode: make it easier to find the out-of-range monitor values
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/edid-decode/edid-decode.hash | 2 +-
>  package/edid-decode/edid-decode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
