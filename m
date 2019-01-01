From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 21:12:02 +0100
Subject: [Buildroot] [PATCH 4/4] package/opus-tools: bump to version 0.2
In-Reply-To: <20190101143702.2736-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 1 Jan 2019 15:37:02 +0100")
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
 <20190101143702.2736-4-thomas.petazzoni@bootlin.com>
Message-ID: <875zv8qgrx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In this release the Opus decoder opusdec has been converted to use the
 > opusfile library, and the Opus encoder opusenc has been converted to
 > use the libopusenc library. These libraries make it easy to robustly
 > read and write Ogg Opus audio files, and enable some new features.

 > Due to this, opus-tools now needs to depend on opusfile and
 > libopusenc. We take this opportunity to reorder alphabetically the
 > dependencies in Config.in and .mk files.

 > The license file hash has changed for two reasons:

 >  - The xiph.org URL was changed from http:// to https://
 >  - White-space changes

 > There are no other changes, and no change that affect the licensing
 > conditions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
