From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 May 2019 11:32:22 +0200
Subject: [Buildroot] [PATCH next 1/4] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <20190528082938.5997-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 28 May 2019 10:29:34 +0200")
References: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
 <20190528082938.5997-2-thomas.petazzoni@bootlin.com>
Message-ID: <87imtu7wm1.fsf@dell.be.48ers.dk>
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

Gnuconfig isn't huge (~100KB), but I wonder if it wouldn't be nicer to
add a normal package (E.G. host-gnuconfig) for it (and add it to
_DEPENDENCIES for pkg-autotools.mk) instead of carrying the files ourselves.

-- 
Bye, Peter Korsgaard
