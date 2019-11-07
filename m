From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Nov 2019 08:01:02 +0100
Subject: [Buildroot] [PATCH] package/yaffs2utils: fix upstream URL
In-Reply-To: <20191102211409.31980-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 2 Nov 2019 22:14:09 +0100")
References: <20191102211409.31980-1-thomas.petazzoni@bootlin.com>
Message-ID: <87eeykb26p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The current URL from which we download the yaffs2utils tarball no
 > longer works:

 > -2019-11-02 10:17:20--  https://yaffs2utils.googlecode.com/files/0.2.9.tar.gz
 > Resolving yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)... 2a00:1450:400c:c02::52, 173.194.76.82
 > Connecting to yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)|2a00:1450:400c:c02::52|:443... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2019-11-02 10:17:20 ERROR 404: Not Found.

 > So, let's replace it with a working URL.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
