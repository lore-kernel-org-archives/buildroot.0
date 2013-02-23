From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 10:30:46 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5126AEA6.7060004@petroprogram.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com> <5126AC9B.30302@mind.be>
 <5126AEA6.7060004@petroprogram.com>
Message-ID: <51288C46.2030001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/13 00:32, Stefan Fr?berg wrote:
> Speaking of udev, I must say that Im not very happy of that recent
> including of systemd as hard dependency.
> If it would be optional then it would be ok and fine, but to forcefully
> cram yet-another init system (in addition to bazillion other existing ones)
> down the throats of latest udev users .... not good, not good at all!

  If I understand correctly, you can still build udev without systemd, 
they're just packaged together. They have added a somewhat hard-to-avoid 
dependency on dbus, though.

  But then, why would you want udev to begin with? mdev can do everything 
that udev can, no?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
