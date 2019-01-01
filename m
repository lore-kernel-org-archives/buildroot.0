From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 21:09:59 +0100
Subject: [Buildroot] [PATCH 1/4] package/opus: bump to version 1.3
In-Reply-To: <20190101143702.2736-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 1 Jan 2019 15:36:59 +0100")
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
Message-ID: <87imz8qgvc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This Opus 1.3 major release again brings quality improvements, new
 > features, and bug fixes. Changes since 1.2.x include:

 > - Improvements to the VAD and speech/music classification using an RNN
 > - Support for ambisonics coding using channel mapping families 2 and 3
 > - Improvements to stereo speech coding at low bitrate
 > - Using wideband encoding down to 9 kb/s
 > - Making it possible to use SILK down to bitrates around 5 kb/s
 > - Minor quality improvement on tones
 > - Enabling the spec fixes in RFC 8251 by default
 > - Security/hardening improvements

 > Notable bug fixes include:

 > - Fixes to the CELT PLC
 > - Bandwidth detection fixes

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
