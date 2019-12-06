From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Dec 2019 09:53:18 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: fix runtime issue with
 Python 3
In-Reply-To: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 3 Dec 2019 17:51:37 +0100")
References: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com>
Message-ID: <87d0d1omwx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > With Python 3.7, genrandconfig fails with:
 > 'str' object has no attribute 'decode'

 > We are already working on str objects, and there is no need to decode
 > them, so we drop the call to decode_byte_list() and its definition as
 > it was only used there.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
