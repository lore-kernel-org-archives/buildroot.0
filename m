From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 15:54:42 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for
 boundarydevices nitrogen6x board
In-Reply-To: <20120925093427.C0B609970E@busybox.osuosl.org>
References: <20120925093427.C0B609970E@busybox.osuosl.org>
Message-ID: <5061B7A2.6060306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/24/12 22:51, Peter Korsgaard wrote:
>   board/boundarydevices/nitrogen6x/6q_bootscript |  Bin 0 ->  455 bytes
>   board/boundarydevices/nitrogen6x/6q_upgrade    |  Bin 0 ->  1587 bytes

  Why not keep these as text files and use host-mkimage to produce the images?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
