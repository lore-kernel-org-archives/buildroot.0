From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:29:37 +0200
Subject: [Buildroot] [PATCH v1] package/rtl8821au: add two patches
 fixing compile/runtime for kernels >= 5.3
In-Reply-To: <20200615185911.16490-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 15 Jun 2020 20:59:11 +0200")
References: <20200615185911.16490-1-ps.report@gmx.net>
Message-ID: <87k0z4wjpa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add two patches from upstream merge request ([1] to fix compile
 > and runtime failures in case of linux kernel >= 5.3.

 > [1] https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/316

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
