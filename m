From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jan 2014 21:16:24 +0100
Subject: [Buildroot] [PATCH 02/10] transmission: add url in Config.in
In-Reply-To: <1390073027-14239-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 18 Jan 2014 20:23:39 +0100")
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87ob37n2w6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/transmission/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/transmission/Config.in b/package/transmission/Config.in
 > index 8d413c6..596b0ed 100644
 > --- a/package/transmission/Config.in
 > +++ b/package/transmission/Config.in
 > @@ -10,6 +10,8 @@ config BR2_PACKAGE_TRANSMISSION
 >  	help
 >  	  Transmission is a cross-platform BitTorrent client.
 
 > +	  https://trac.transmissionbt.com/

Committed with the URL changed to the homepage as pointed out by Yann,
thanks.

-- 
Bye, Peter Korsgaard
