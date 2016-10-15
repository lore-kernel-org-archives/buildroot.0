From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:27:40 +0200
Subject: [Buildroot] [PATCH] package/urg: update homepage url
In-Reply-To: <20161015092012.1759-1-s.martin49@gmail.com> (Samuel Martin's
 message of "Sat, 15 Oct 2016 11:20:12 +0200")
References: <20161015092012.1759-1-s.martin49@gmail.com>
Message-ID: <87funyq7w3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/urg/Config.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/urg/Config.in b/package/urg/Config.in
 > index 9d57645..c602624 100644
 > --- a/package/urg/Config.in
 > +++ b/package/urg/Config.in
 > @@ -4,7 +4,7 @@ config BR2_PACKAGE_URG
 >  	help
 >  	  Library to control Hokuyo's URG series sensors.
 
 > -	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
 > +	  https://sourceforge.net/p/urgnetwork/wiki/Home/

What about the source code location? That one also seems to generate a
404 here:

wget http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/urg-0.8.18.zip
--2016-10-15 11:27:00--  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/urg-0.8.18.zip
Resolving www.hokuyo-aut.jp (www.hokuyo-aut.jp)... 133.18.9.243
Connecting to www.hokuyo-aut.jp (www.hokuyo-aut.jp)|133.18.9.243|:80... connected.
HTTP request sent, awaiting response... 404 Not Found

-- 
Bye, Peter Korsgaard
