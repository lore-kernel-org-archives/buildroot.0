From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:35:36 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/openresolv: update to fix
 install location
In-Reply-To: <20190117150542.13062-1-jared.bents@rockwellcollins.com> (jared
 bents's message of "Thu, 17 Jan 2019 09:05:42 -0600")
References: <20190117150542.13062-1-jared.bents@rockwellcollins.com>
Message-ID: <87imy75smf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jared" == jared bents <jared.bents@rockwellcollins.com> writes:

 > From: Jared Bents <jared.bents@rockwellcollins.com>
 > Update to install in /sbin as expected by other applications
 > such as strongswan instead of /usr/sbin

 > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
