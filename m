From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Oct 2013 08:47:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-10-24
In-Reply-To: <526A4D39.3040106@zacarias.com.ar>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>
 <526A26EB.7010804@mind.be> <20131025124746.0dbffd63@skate>
 <526A4D39.3040106@zacarias.com.ar>
Message-ID: <20131026084741.5cab8678@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 25 Oct 2013 07:51:37 -0300, Gustavo Zacarias wrote:
> On 10/25/2013 07:47 AM, Thomas Petazzoni wrote:
> > Not sure what's going on... They blacklisted the build server IP address
> > because I'm downloading things too many times?
> 
> Very likely.

Interestingly, Yann E. Morin also reported the same problem (Connection
refused) when connecting from one of his machine, which has (as far as
I know) is not used as a build server that could cause repeated
downloads of the mpd tarball. So it seems like it's not such my build
server that has been blacklisted. Maybe something we should report to
the musicpd people.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
