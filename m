From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 20:56:07 +0200
Subject: [Buildroot] [PATCH/next] acpid: use shutdown for poweroff,
 if available, not /sbin/poweroff
In-Reply-To: <20180910211539.1763d962@windsurf> (Thomas Petazzoni's message of
 "Mon, 10 Sep 2018 21:15:39 +0200")
References: <20180830132120.10889-1-casantos@datacom.com.br>
 <20180910211539.1763d962@windsurf>
Message-ID: <87sh1p3394.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Thu, 30 Aug 2018 10:21:20 -0300, Carlos Santos wrote:
 >> It's preferable to use "shutdown -hP now" to ensure that the runlevel is
 >> known, preventing this message on the system console and log:
 >> 
 >> WARNING: could not determine runlevel - doing soft poweroff
 >> (it's better to use shutdown instead of poweroff from the command line)
 >> 
 >> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 >> ---
 >> package/acpid/acpid.mk | 8 +++++++-
 >> 1 file changed, 7 insertions(+), 1 deletion(-)

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
