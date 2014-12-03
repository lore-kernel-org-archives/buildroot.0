From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 09:22:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/dejavu: add hashes from project
	site
In-Reply-To: <1417552930-26836-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Tue, 2 Dec 2014 21:42:09 +0100")
References: <1417552930-26836-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87wq69ywfv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/dejavu/dejavu.hash | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
 > index 11e0d1c..282d68f 100644
 > --- a/package/dejavu/dejavu.hash
 > +++ b/package/dejavu/dejavu.hash
 > @@ -1,2 +1,5 @@
 > +# From http://dejavu-fonts.org/wiki/Download
 > +md5 161462de16e2ca79873bc2b0d2e6c74c dejavu-fonts-ttf-2.34.tar.bz2
 > +sha256 d0a72c3ae99f5b8d7470daf091ec43f78dc942795aed5c996ab1aa678702eb5d dejavu-fonts-ttf-2.34.tar.bz2
 >  # Locally computed
 >  sha1 33fa825aa1dd44ce23a11af92b3078e978ff513d dejavu-fonts-ttf-2.34.tar.bz2

With md5 + sha256 I don't really think we need the locally generated
sha1 anymore, so I've dropped that and committed, thanks.

-- 
Bye, Peter Korsgaard
