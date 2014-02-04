From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:24:00 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <20140204132117.GE30185@ldesroches-Latitude-E6320> (Ludovic
 Desroches's message of "Tue, 4 Feb 2014 14:21:17 +0100")
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
 <20140204112654.GD30185@ldesroches-Latitude-E6320>
 <87zjm7cae2.fsf@dell.be.48ers.dk>
 <20140204132117.GE30185@ldesroches-Latitude-E6320>
Message-ID: <87zjm75533.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:

Hi,

 > I understand this point of view and I am fine with it. But my concern
 > is that some customers want something working out of the box. For
 > instance, we often use devmem2 for debugging purpose or other tools
 > such as i2c-tools. It is easier for us to have it in a defconfig
 > file.

 > I am not trying to convince you to take this defconfig as is! Just to
 > know if there is a way to provide specific packages? If not, it will
 > be provided only in our buildroot-at91 repository. I am also fine
 > with this, if the customer wants something out of the box then he'll
 > have to use our repository. Otherwise he could use buildroot one.

I understand. We're been discussing something like this a few times
(E.G. full blown "demo" defconfigs), but for now I prefer to keep the
variant in buildroot minimal.

-- 
Bye, Peter Korsgaard
