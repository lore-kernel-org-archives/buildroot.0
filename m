From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Wed, 27 Aug 2008 04:53:01 -0700 (PDT)
Subject: [Buildroot]  MTD-utils version bounce
Message-ID: <19179409.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


All,

I would like to bounce the mtd-utils version from 1.1.0 to 1.2.0.  This is
the latest release and contains many fixes.  However I do not want to do
this if it breaks stuff for everyone else.
I am not happy with using a GIT checkout every time.  
So the question is 
1.) Do I bounce version and make makefile like mtd-utils.git
2.) Create another mtd target of 1.2.0 

Daniel Laird
-- 
View this message in context: http://www.nabble.com/MTD-utils-version-bounce-tp19179409p19179409.html
Sent from the BuildRoot mailing list archive at Nabble.com.
