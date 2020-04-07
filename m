From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:13:43 +0200
Subject: [Buildroot] [PATCH] package/busybox: fix target-finalize hook
In-Reply-To: <20200325003053.6305-1-unixmania@gmail.com> (unixmania's message
 of "Tue, 24 Mar 2020 21:30:53 -0300")
References: <20200325003053.6305-1-unixmania@gmail.com>
Message-ID: <87d08jp3jc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > It was searching for CONFIG_ASH=y and CONFIG_HUSH=y at $(@D)/.config,
 > which does not contain the package build path at the target-finalize
 > step. Use $(BUSYBOX_DIR), instead.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
