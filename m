From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 10:41:22 +0200
Subject: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
In-Reply-To: <20210510180049.61421-4-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Mon, 10 May 2021 11:00:47 -0700")
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com>
Message-ID: <8735uhbxvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > otherwise memsize bails out and erroneously reports 1 MB
 > NOK
 > ----
 > | />/lmbench/bin/arc/memsize 16
 > |
 > | 1

 > OK
 > ---
 > | />/lmbench/bin/arc/memsize 16
 > | 2MB OK3MB OK4MB OK5MB OK6MB OK7MB OK8MB OK9MB OK10MB OK11MB OK12MB OK13MB OK14MB OK15MB OK16MB OK
 > | 16

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
