From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 22:02:13 +0100
Subject: [Buildroot] [PATCH 1/5] tmp2-tss: remove architecture
 restriction
In-Reply-To: <20180315125602.26186-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 15 Mar 2018 09:55:58 -0300")
References: <20180315125602.26186-1-casantos@datacom.ind.br>
Message-ID: <87605tf67e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Followingig a suggestion from Peter Korsgaard, remove the restriction to
 > x86 and x86_64. It is preferable to expose the package unless there is a
 > build time dependency on an architecture or the package is specific to a
 > certain SoC or board.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
