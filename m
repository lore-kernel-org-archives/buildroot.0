From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 12:36:55 +0200
Subject: [Buildroot] [PATCH v2 3/6] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <20190528203416.32261-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 28 May 2019 22:34:13 +0200")
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-4-thomas.petazzoni@bootlin.com>
Message-ID: <877ea844ag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This update includes support for the C-SKY architecture.
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Note: this was suggested by Peter for next, instead of just patching
 > the files to add csky support. It should be applied after
 > cherry-picking 910b431d6383cd1ce4cd9eeb0a8466cb977c3789 from master.

Are you sure about that? It seems to apply nicely as is to next, and
fail with a merge conflict if I cherry-pick 910b431?

-- 
Bye, Peter Korsgaard
