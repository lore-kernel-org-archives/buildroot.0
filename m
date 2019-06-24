From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:53:47 +0200
Subject: [Buildroot] [PATCH v2 1/2] lmbench: mark scripts/build as bash
 script
In-Reply-To: <20190613195047.24870-2-mmayer@broadcom.com> (Markus Mayer's
 message of "Thu, 13 Jun 2019 12:50:46 -0700")
References: <20190613195047.24870-1-mmayer@broadcom.com>
 <20190613195047.24870-2-mmayer@broadcom.com>
Message-ID: <87lfxqlpys.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

 > scripts/build makes use of the "+=" operator which is not supported by
 > /bin/sh. We switch to /bin/bash in order to avoid errors of the form

 >     ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
