From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 13:39:39 +0100
Subject: [Buildroot] [PATCH 1/2] ProFTPD: Add config option to enable
	mod_rewrite
In-Reply-To: <513475CC.8010705@relinux.de> (Stephan Hoffmann's message of
 "Mon, 04 Mar 2013 11:22:04 +0100")
References: <1360061657-2329-1-git-send-email-sho@relinux.de>
 <513475CC.8010705@relinux.de>
Message-ID: <874ngrcp9w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Ping?
 Stephan> I'd really like to get this committed since I am using it in a customer
 Stephan> system.

 Stephan> Am 05.02.2013 11:54, schrieb Stephan Hoffmann:
 >> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 >> ---
 >> package/proftpd/Config.in  |    6 ++++++
 >> package/proftpd/proftpd.mk |    4 ++++
 >> 2 files changed, 10 insertions(+), 0 deletions(-)
 >> 
 >> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
 >> index abdedc9..7866e0a 100644
 >> --- a/package/proftpd/Config.in
 >> +++ b/package/proftpd/Config.in
 >> @@ -4,3 +4,9 @@ config BR2_PACKAGE_PROFTPD
 >> ProFTPD, a highly configurable FTP server.
 >> 
 >> http://www.proftpd.org/
 >> +
 >> +config BR2_PACKAGE_PROFTPD_MOD_REWRITE
 >> +	bool "proftpd mod_rewrite"

Committed with the option text changed to "mod_rewrite support", thanks.

-- 
Bye, Peter Korsgaard
