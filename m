From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:24:22 +0200
Subject: [Buildroot] [PATCH v3 2/3] configs/atmel: bump to linux4sam_6.1
In-Reply-To: <20190731134649.20701-2-ludovic.desroches@microchip.com> (Ludovic
 Desroches's message of "Wed, 31 Jul 2019 15:46:48 +0200")
References: <20190731134649.20701-1-ludovic.desroches@microchip.com>
 <20190731134649.20701-2-ludovic.desroches@microchip.com>
Message-ID: <87wofwu4kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@microchip.com> writes:

 > Only the atmel_sama5d27_som1 board was bumped to linux4sam_6.1 so update
 > the other boards.

 > Moreover, display variant device trees are no longer in the linux4sam
 > kernel tree as we have adopted the DT overlays. In case of interest for those
 > DTs, please use the Microchip external available here:
 > https://github.com/linux4sam/buildroot-external-microchip

 > Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
 > ---

 > Changes:
 > -v3:
 >   - no changes, add patches 1 and 3. 1 prevents errors when building the
 >     sdcard image due to the removal of some dtbs. 3 expands the patch
 >     from Pierre-Jean Texier to other defconfigs.

Committed, thanks.

-- 
Bye, Peter Korsgaard
