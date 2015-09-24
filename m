From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 23:02:58 +0200
Subject: [Buildroot] [PATCH 2/3] New entry for the Cortex-M4 processor
In-Reply-To: <20150915205208.GE3650@free.fr> (Yann E. MORIN's message of "Tue, 
 15 Sep 2015 22:52:08 +0200")
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <1442127768-26447-2-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913102136.01d94129@free-electrons.com>
 <20150915205208.GE3650@free.fr>
Message-ID: <87oagro7i5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > It is my understanding that -mthumb will generate Thumb2 instructions on
 > cores that have Thumb2 (e.g. Cortex), and Thumb (aka Thumb1) on cores
 > that do not have Thumb2.

 > Also, since Thumb2 is a strict superset of Thumb, then having Thumb2
 > means having Thumb, at least from an instruction set point of view.

 > I believe Thumb2 should select Thumb.

Yes, that sounds sensible.

-- 
Bye, Peter Korsgaard
