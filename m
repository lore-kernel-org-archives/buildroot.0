From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:30:49 +0100
Subject: [Buildroot] [PATCH] package/libpam-tacplus: fix compilation
 with GCC 8
In-Reply-To: <20181211112113.21648-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Tue, 11 Dec 2018 09:21:13 -0200")
References: <20181211112113.21648-1-casantos@datacom.com.br>
Message-ID: <87h8fd5fcm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > GCC 8 demands that the size of the string copied by strncpy be smaller
 > than the size of the destination to keep space for the trailibg '\0'.
 > This causes a compilation error in pam_tacplus, so add a patch already
 > sent uptream to fix it.

 > Fixes:
 >   http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
