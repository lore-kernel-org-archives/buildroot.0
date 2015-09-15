From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2015 15:14:56 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <20150915150303.61e5449e@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 15 Sep 2015 15:03:03 +0200")
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
 <87k2rrvqlh.fsf@dell.be.48ers.dk> <55F80E9C.7070208@mind.be>
 <20150915150303.61e5449e@free-electrons.com>
Message-ID: <87bnd3vn73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > But then, who creates /dev/console when devtmpfs is not available? We
 > have it unconditionally?

I would say so, especially as we also "need" it for initramfs.

-- 
Venlig hilsen,
Peter Korsgaard 
