From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:50:56 +0100
Subject: [Buildroot] [PATCH v1] configs/chromebook_elm_defconfig: use
 linux headers same as kernel (5.9 series)
In-Reply-To: <20201219192445.27681-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 19 Dec 2020 20:24:45 +0100")
References: <20201219192445.27681-1-ps.report@gmx.net>
Message-ID: <87sg7yktbj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Use linux headers same as kernel (5.9 series).
 > Fixes:

 >   - https://gitlab.com/buildroot.org/buildroot/-/jobs/917539050

 >   Incorrect selection of kernel headers: expected 5.10.x, got 5.9.x

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
