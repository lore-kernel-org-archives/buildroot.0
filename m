From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:23:55 +0200
Subject: [Buildroot] [PATCH 2/3] dhcpdump: add project URL
In-Reply-To: <1445349954-44062-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 20 Oct 2015 15:05:53 +0100")
References: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
 <1445349954-44062-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d1w9jnl0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/dhcpdump/Config.in |    2 ++
 >  1 files changed, 2 insertions(+), 0 deletions(-)

 > diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
 > index 1840e34..2368a46 100644
 > --- a/package/dhcpdump/Config.in
 > +++ b/package/dhcpdump/Config.in
 > @@ -3,3 +3,5 @@ config BR2_PACKAGE_DHCPDUMP
 >  	select BR2_PACKAGE_LIBPCAP
 >  	help
 >  	  A tool for monitoring dhcp requests using tcpdump.
 > +
 > +	  http://www.mavetju.org/

Actually, this is more like a personal page. I've changed it to
http://www.mavetju.org/unix/general.php instead.

-- 
Bye, Peter Korsgaard
