From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Aug 2010 18:23:38 +0200
Subject: [Buildroot] Build failure with 2010.08-rc1
In-Reply-To: <AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
References: <AANLkTikDrKuuL2q6Mp_rL-MFVg4nBoTMJeHiGAXFJoM-@mail.gmail.com>
	<AANLkTikMVTNWWPhg1N_30m1MsLmuSv6yjya7j76oW_v4@mail.gmail.com>
Message-ID: <20100810182338.5c2b987c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Aug 2010 14:23:35 +0100
Will Newton <will.newton@gmail.com> wrote:

> This problem appears to only affect gcc 4.2.4.

Interesting. I'm 100% sure that 2 weeks ago, gcc 4.2.2 for AVR32 was
building correctly. And with today's Git, it doesn't build, failing
with the exact same error message you're having.

I'm currently retrying the build with the Git as it was two weeks ago
and will start bisecting. I'm kind of suspecting the changes made to
the gcc build procedure to support NPTL in uClibc.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
