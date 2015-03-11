From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:40:37 +0100
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <20150311214543.597e639b@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 11 Mar 2015 21:45:43 +0100")
References: <550069E9.5060403@zacarias.com.ar>
 <20150311214543.597e639b@free-electrons.com>
Message-ID: <87a8zjjjqi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,


 >> It's 2015 after all, and the size delta is minor:
 >> 
 >> tar file delta, arm926 uclibc+busybox
 >> =====================================
 >> Threading (NPTL)        +153600 bytes

 > Ah, too bad. I was hoping to also suggest to remove the no-thread
 > solution. The number of packages that need threads these days is really
 > enormous, and I'm not really sure in practice how many people are doing
 > no-thread based systems.

Yeah, it is potentially useful for tiny initramfs'es with only busybox
and similar stuff, but not for anything bigger.

-- 
Bye, Peter Korsgaard
