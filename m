From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 11:04:44 +0100
Subject: [Buildroot] [PATCH v1] package/pulseaudio: fix S50pulseaudio
 init script
In-Reply-To: <20190213190547.6383-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 13 Feb 2019 20:05:47 +0100")
References: <20190213190547.6383-1-ps.report@gmx.net>
Message-ID: <8736ogqgub.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - fix the following start warnings:
 >   W: [pulseaudio] main.c: Running in system mode, but --disallow-exit not set.
 >   W: [pulseaudio] main.c: Running in system mode, but --disallow-module-loading not set.
 >   N: [pulseaudio] main.c: Running in system mode, forcibly disabling SHM mode.
 >   N: [pulseaudio] main.c: Running in system mode, forcibly disabling exit idle time.

 > - fix the following stop error:

 >   E: [pulseaudio] main.c: Failed to kill daemon: No such process

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
