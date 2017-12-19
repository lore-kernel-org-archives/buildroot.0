From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 21:50:24 +0100
Subject: [Buildroot] [PATCH v1] package/linux-firmware: Add Atheros 10k
 (QCA998X)
In-Reply-To: <1513694851-42024-1-git-send-email-sam.voss@rockwellcollins.com>
 (Sam Voss's message of "Tue, 19 Dec 2017 08:47:31 -0600")
References: <1513694851-42024-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <871sjq788f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Voss <sam.voss@rockwellcollins.com> writes:

 > Add drivers for Atheros 10k (QCA998X) chipset.
 > Both firmware versions are imported, and unused should be pruned as
 > required.

 > Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
 > ---
 >  package/linux-firmware/Config.in         | 5 +++++
 >  package/linux-firmware/linux-firmware.mk | 8 ++++++++
 >  2 files changed, 13 insertions(+)

 > diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
 > index 905b32a..230097f 100644
 > --- a/package/linux-firmware/Config.in
 > +++ b/package/linux-firmware/Config.in
 > @@ -78,6 +78,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 >  	help
 >  	  Firmware files for the Atheros 9271 module
 
 > +config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10k_QCA998X

Config.in symbol names should be all in upper case, so I did s/10k/10K/
and committed, thanks.

-- 
Bye, Peter Korsgaard
