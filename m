From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:21:39 +0200
Subject: [Buildroot] [PATCH 3/3] mdadm: also install mdmon
In-Reply-To: <20181014200056.20220-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 22:00:56 +0200")
References: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
 <20181014200056.20220-3-thomas.petazzoni@bootlin.com>
Message-ID: <87r2grokd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adjusts the mdadm package to also install the mdmon
 > utility, which is used to "monitor MD external metadata arrays". It
 > adds ~250 KB to the installed size:

 > -rwxr-xr-x 1 thomas thomas 446064 Oct 14 21:55 mdadm
 > -rwxr-xr-x 1 thomas thomas 244672 Oct 14 21:55 mdmon

 > Fixes bug #11376.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
