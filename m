From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:50:23 +0200
Subject: [Buildroot] [PATCH 1/2] Use HOSTCC_NOCCACHE for both
	core-dependencies and DEPENDENCIES_HOST_PREREQ
In-Reply-To: <efc013bf-90ed-d6c2-ae6e-12ef3335b50e@mind.be> (Arnout
 Vandecappelle's message of "Sun, 22 Oct 2017 15:43:31 +0200")
References: <1493372121-32177-1-git-send-email-alfredo.alvarez_fernandez@nokia.com>
 <efc013bf-90ed-d6c2-ae6e-12ef3335b50e@mind.be>
Message-ID: <874lqq94r4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 28-04-17 11:35, Alfredo Alvarez Fernandez wrote:
 >> This also fixes make clean host-ccache
 >> 
 >> Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>

 >  Both applied to master, thanks. I extended the commit message quite a bit,
 > because it was not at all clear why this was needed.

Committed both to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
