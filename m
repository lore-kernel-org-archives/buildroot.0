From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 18:28:05 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/batman-adv: add note about
 linux mainline kernel module alternative
In-Reply-To: <20210316181429.30804-3-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 16 Mar 2021 19:14:29 +0100")
References: <20210316181429.30804-1-ps.report@gmx.net>
 <20210316181429.30804-3-ps.report@gmx.net>
Message-ID: <87v99hok4a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Since version 2.6.38 batman-adv is integreated into the linux mainline
 > kernel ([1], [2]) so add a note about it in the Config.in help text.

 > [1] https://kernelnewbies.org/Linux_2_6_38
 > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6c8fea29769d998d94fcec9b9f14d4b52b349d3

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
