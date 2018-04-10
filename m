From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:41:58 +0200
Subject: [Buildroot] [git commit] dhcp: disable isc assertions
 (reproducible builds)
In-Reply-To: <20180203215454.E6A1588308@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 3 Feb 2018 22:50:09 +0100")
References: <20180203215454.E6A1588308@busybox.osuosl.org>
Message-ID: <87sh827q09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3d1a7a86205a31625a8d5e8666ae7eb357e0de75
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The isc assertions from the bundled bind dns library are
 > using the __FILE__ macro for debug messages (see
 > dhcp-4.3.5/bind/bind-9.9.9-P3/lib/isc/include/isc/assertions.h).

 > Disabling the assertions gains:

 > - reproducible builds (no build time paths in the executable)
 > - space saving on the target:
 >   dhcpd: 1.9M -> 1.6M
 >   dhcrelay: 1.6M -> 1.3M

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
