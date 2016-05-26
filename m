From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 21:55:43 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <5747443D.2020109@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 26 May 2016 15:45:17 -0300")
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
 <20160526203517.1a2a3670@free-electrons.com>
 <57474262.2020500@zacarias.com.ar>
 <20160526204157.201c0d78@free-electrons.com>
 <5747443D.2020109@zacarias.com.ar>
Message-ID: <877feg61c0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > Yes, that would be suitable, expect for 8 GB cards where you "loose"
 > space :)

And the fact that 4GB cards are normally a bit less than 4GB big (and
the "bit" afaik varies with the card).

> The other approach which i briefly mentioned is on first boot running
 > a resize script that adjusts the partition table to grow the last
 > partition to fit the running block device and resizes the filesystem.
 > Of course it has some limitations, like ext2/3/4 filesystems (some
 > others as well) and having some tools around for the trick.
 > Regards.

Yes, either at first boot or from the host after writing the image.

-- 
Venlig hilsen,
Peter Korsgaard 
