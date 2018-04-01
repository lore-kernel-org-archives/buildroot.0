From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 22:52:25 +0200
Subject: [Buildroot] [PATCH v2 1/2] coreutils: rewrite for loop with
 foreach
In-Reply-To: <20180401153905.14483-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Apr 2018 17:39:04 +0200")
References: <20180401153905.14483-1-thomas.petazzoni@bootlin.com>
 <20180401153905.14483-2-thomas.petazzoni@bootlin.com>
Message-ID: <87bmf2ps3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This brings up error checking at each iteration of the loop for free,
 > which removes the need for "|| exit 1".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
