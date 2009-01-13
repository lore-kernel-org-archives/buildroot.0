From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Jan 2009 07:09:34 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
In-Reply-To: <20090113002821.GB32708@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 13 Jan 2009 11\:28\:21 +1100")
References: <20090112124048.BBE95766E4@busybox.osuosl.org>
	<20090113002821.GB32708@cloud.net.au>
Message-ID: <87ocybenz5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 >> touch -c $(TARGET_DIR)/usr/share/fonts/.ttf

 Hamish> What's the purpose of the .ttf file touched in the staging
 Hamish> and target dirs?

Yes, Bernhard noticed that as well.

 Hamish> Why is the font installed into the staging dir at all?

Good question.

-- 
Bye, Peter Korsgaard
