From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 20:22:36 +0100
Subject: [Buildroot] [PATCH next 0/3] Update TPM2 packages
In-Reply-To: <20181116025217.27928-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Fri, 16 Nov 2018 00:52:14 -0200")
References: <20181116025217.27928-1-casantos@datacom.com.br>
Message-ID: <87lg5ssu83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > This series should be applied in a single commit, since the upgrade of
 > tpm2-tss breaks tpm2-abrmd and tpm2-tools if they are not upgraded too.
 > A single large patch, however, would be much harder to review.

 > Carlos Santos (3):
 >   tpm2-tss: bump to version 2.1.0
 >   tpm2-abrmd: bump to version 2.0.3
 >   tpm2-tools: bump to version 3.1.3

Committed series to next, thanks. I did leave them as 3 separate commits
though.

-- 
Bye, Peter Korsgaard
