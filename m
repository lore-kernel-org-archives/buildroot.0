From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:28:40 +0100
Subject: [Buildroot] [PATCH] package/skeleton-init-openrc: fix root
 filesystem ro/rw remount
In-Reply-To: <20200224114134.25887-1-unixmania@gmail.com> (unixmania's message
 of "Mon, 24 Feb 2020 08:41:34 -0300")
References: <20200224114134.25887-1-unixmania@gmail.com>
Message-ID: <87eetux5mv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > The regular expressions used in the sed commands assumes that there is a
 > space after '/dev/root' but the skeleton file contains a tab. Use a more
 > flexible '[[:blank:]]', instead.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.11.x (not in 2019.02.x), thanks.

-- 
Bye, Peter Korsgaard
