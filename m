From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Oct 2015 12:03:39 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <560CFE8C.7010808@lucaceresoli.net> (Luca Ceresoli's message of
 "Thu, 1 Oct 2015 11:36:12 +0200")
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
 <20150915114159.758baca9@free-electrons.com>
 <87k2rrvqlh.fsf@dell.be.48ers.dk> <560CFE8C.7010808@lucaceresoli.net>
Message-ID: <878u7mx5vo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

>> This adds the nodename callback for struct class, struct device_type and
 >> struct device, to allow drivers to send userspace hints on the device
 >> name and subdirectory that should be used for it.
 >> 
 >> Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
 >> Signed-off-by: Jan Blunck <jblunck@suse.de>
 >> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

 > Wow, it works! Well, at least it boots, I haven't tested everything,
 > but it was far simpler that I suspected. Thanks for the hint!

Wee, that's good to hear!

-- 
Venlig hilsen,
Peter Korsgaard 
