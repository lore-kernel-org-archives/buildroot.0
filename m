From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 18:28:38 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/batman-adv: needs linux
 kernel libcrc32c support
In-Reply-To: <20210316181429.30804-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 16 Mar 2021 19:14:28 +0100")
References: <20210316181429.30804-1-ps.report@gmx.net>
 <20210316181429.30804-2-ps.report@gmx.net>
Message-ID: <87r1k5ok3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes:
 >   ERROR: modpost: "crc32c" [.../build/batman-adv-2021.0/net/batman-adv/batman-adv.ko] undefined!

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.11.x and 2021.02.x, thanks. I did NOT apply it to
2020.02.x as we don't have the _LINUX_CONFIG_FIXUPS infrastructure
there.

-- 
Bye, Peter Korsgaard
