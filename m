From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Nov 2013 12:44:10 +0100
Subject: [Buildroot] [PATCH 1/1] mongoose: wait some time between stop
	and start of the service
In-Reply-To: <1385387725-1733-1-git-send-email-d.viti@infosolution.it> (Davide
 Viti's message of "Mon, 25 Nov 2013 14:55:25 +0100")
References: <1385387725-1733-1-git-send-email-d.viti@infosolution.it>
Message-ID: <87vbzfjsl1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

 > Startup script fails to restart the service: 1s delay is enough to fix
 > this.

 > Also apply a minor fix of the script name in the usage string

 > Signed-off-by: Davide Viti <d.viti@infosolution.it>

Committed, thanks.

-- 
Bye, Peter Korsgaard
