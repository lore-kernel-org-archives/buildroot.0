From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Mar 2016 21:54:27 +0100
Subject: [Buildroot] [PATCH] busybox: use md5 as default password
	algorithm
In-Reply-To: <20160323000315.6f732d8f@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 23 Mar 2016 00:03:15 +0100")
References: <1457638990-27544-1-git-send-email-gustavo@zacarias.com.ar>
 <20160323000315.6f732d8f@free-electrons.com>
Message-ID: <87zitna96k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > I've (obviously) read the discussion with Peter, but I believe the
 > issue he is raising is different. We already have our Busybox
 > configuration default to "des", which is not consistent with the algo
 > choice made by the user in the Buildroot configuration. So switching
 > to "md5" is not making things any worse from that perspective.

True. It would be good if we could make busybox default to the algorithm
we've selected in buildroot, but that can be done later.

-- 
Bye, Peter Korsgaard
