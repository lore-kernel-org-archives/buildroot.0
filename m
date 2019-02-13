From: Christian Stewart <christian@paral.in>
Date: Tue, 12 Feb 2019 17:13:12 -0800
Subject: [Buildroot] [PATCH 4/4] docker-engine: fix runc version check
 warning
In-Reply-To: <87zhr0sqg5.fsf@dell.be.48ers.dk>
References: <20190212093531.13145-1-christian@paral.in>
 <20190212093531.13145-4-christian@paral.in> <87zhr0sqg5.fsf@dell.be.48ers.dk>
Message-ID: <87pnrwh4nr.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
> Please submit the patch upstream.

The patch for docker-engine no longer applies upstream, they have
recently overhauled the unix version detection code.

Best,
Christian
