From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 14:26:08 +0100
Subject: [Buildroot] [PATCH v2 7/7] tpm2-abrmd: S80tpm2-abrmd: create
 pid file at startup
In-Reply-To: <20190115101522.21042-7-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 15 Jan 2019 11:15:22 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-7-peter@korsgaard.com>
Message-ID: <87won4d98v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The start-stop-daemon invocation to start abrmd was missing the -m (make
 > pidfile) option, causing stop to fail.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
