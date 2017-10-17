From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:07:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx/S50nginx: Do not assume
	start-stop-daemon knows -R.
In-Reply-To: <20171009095049.22290-1-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Mon, 9 Oct 2017 11:50:49 +0200")
References: <87bmluk4bm.fsf@dell.be.48ers.dk>
 <20171009095049.22290-1-thomas.claveirole@green-communications.fr>
Message-ID: <87o9p6i1mh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > start-stop-daemon fails on -R when not compiled with
 > CONFIG_FEATURE_START_STOP_DAEMON_FANCY.  Thus, do not rely on -R
 > during stop to avoid a race condition during restart.

 > Use a sleep 1 during restart instead, as suggested by Peter Korsgaard
 > in <87bmluk4bm.fsf@dell.be.48ers.dk>.

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
