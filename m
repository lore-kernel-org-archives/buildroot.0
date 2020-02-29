From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 17:33:24 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: in image install,
 print message before pre-hooks
In-Reply-To: <20200228150421.1240651-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Feb 2020 16:04:20 +0100")
References: <20200228150421.1240651-1-thomas.petazzoni@bootlin.com>
Message-ID: <875zfpica3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In all steps, we print the message indicating the start of the step
 > using the MESSAGE macro before running pre-hooks. Except in the image
 > installation step, where the message is printed after the pre-hooks.

 > Let's fix this inconsistency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
