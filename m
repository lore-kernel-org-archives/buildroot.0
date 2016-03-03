From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Mar 2016 22:12:51 +0100
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <nba94j$m0k$1@ger.gmane.org> (Grant Edwards's message of "Thu, 3
 Mar 2016 21:08:35 +0000 (UTC)")
References: <bug-8736-163@https.bugs.busybox.net/>
 <bug-8736-163-ImR2b9Yvou@https.bugs.busybox.net/>
 <nba94j$m0k$1@ger.gmane.org>
Message-ID: <87twkn6zak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 > On 2016-03-03, bugzilla at busybox.net <bugzilla@busybox.net> wrote:
 > [Regarding restoring the ability to configure buildroot with IPv6
 > support disabled because some utilities don't work right with IPv6
 > enabled.]

 >> That sounds like a bug in busybox that should be fixed instead of
 >> worked around then. What exactly goes wrong? Have you reported the
 >> bug to the busybox developers?

 > I agree that IPv6 support (if broken) needs to be fixed.  But I think
 > it's also important to restore the ability to disable IPv6 support.  I
 > have customers who explicity state that they want no IPv6 support in
 > their products.

Yes, I think we should drop the forced ipv6 (and largefile) config
modifications and just enable them in our default busybox config instead.

-- 
Bye, Peter Korsgaard
