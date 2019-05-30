From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 12:34:07 +0200
Subject: [Buildroot] [PATCH v2 2/6] support/gnuconfig: update
 README.buildroot with reality
In-Reply-To: <20190528203416.32261-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 28 May 2019 22:34:12 +0200")
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-3-thomas.petazzoni@bootlin.com>
Message-ID: <87blzk44f4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > 4 out of 5 packages who are not using autotools but needed their
 > gnuconfig files updated were not complying with the recommandation in
 > support/gnuconfig/README.buildroot. The fifth package was converted to
 > be like the others: use UPDATE_CONFIG_HOOK as a <pkg>_POST_PATCH_HOOKS
 > rather than calling the CONFIG_UPDATE macro directly.

 > Now that all packages are consistent, update the README.buildroot file
 > to match the reality.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
