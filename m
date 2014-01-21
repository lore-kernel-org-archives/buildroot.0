From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jan 2014 09:43:40 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <CAAXf6LU_YFDERq8aEYTfWa-H7ijBV-e9VNCnpnYTa7pAduobfg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 21 Jan 2014 09:04:12
 +0100")
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <CAAXf6LU_YFDERq8aEYTfWa-H7ijBV-e9VNCnpnYTa7pAduobfg@mail.gmail.com>
Message-ID: <87k3dtiv2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > Although the discussion raised some interesting points, I believe this
 > patch is ok to accept as-is.

True. The explicit /bin/echo was afaik to make sure we end up with an
echo variant (most likely coreutils) that understands -e, but if we're
changing it to printf anyway.

Committed, thanks.

-- 
Bye, Peter Korsgaard
