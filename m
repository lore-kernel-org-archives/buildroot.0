From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 16:52:20 +0100
Subject: [Buildroot] [PATCH] package/openssh: Set /var/empty permissions
In-Reply-To: <a7847e0d-f51a-0000-c3c4-3d53d85b2db3@mind.be> (Arnout
 Vandecappelle's message of "Sun, 3 Feb 2019 21:53:04 +0100")
References: <20181217222522.13499-1-chris.lesiak@licor.com>
 <a7847e0d-f51a-0000-c3c4-3d53d85b2db3@mind.be>
Message-ID: <87ftslaybv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 17/12/2018 23:25, Chris Lesiak wrote:
 >> The openssh privilege separation feature, enabled by default,
 >> requires that the path /var/empty exist and have certain permission.
 >> See README.privsep included as part of the openssh distribution.
 >> 
 >> Use OPENSSH_PERMISSIONS to ensure this is done correctly.

 >  I've added some of the discussion to the commit message and applied to master,
 > thanks.

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
