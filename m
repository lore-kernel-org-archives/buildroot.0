From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Nov 2020 09:44:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/bind: bump to version 9.11.24
In-Reply-To: <20201104194727.29804-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Wed, 4 Nov 2020 20:47:27 +0100")
References: <20201104194727.29804-1-petr.vorel@gmail.com>
Message-ID: <87imak19cf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Turn 0001-cross.patch into git patch.
 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed to next, thanks.

 > ---
 > Hi,

 > Any reason for keeping 9.11.x instead taking current stable 9.16.8?
 > I haven't verified whether HOSTCC patch is still needed.

9.11 was the LTS version, but I see that 9.16 will become the new LTS -
So feel free to bump to 9.16.x instead.

-- 
Bye, Peter Korsgaard
