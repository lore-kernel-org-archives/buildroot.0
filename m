From: samMHN <mouhoune@osmos-group.com>
Date: Wed, 17 May 2017 08:45:33 -0700 (PDT)
Subject: [Buildroot] Hop tout set svn credentials when using svn to
 download tarballs
In-Reply-To: <87a86ejq1i.fsf@dell.be.48ers.dk>
References: <D02BDAEC-5CBA-4A06-9645-C6663DB2F3DC@osmos-group.com>
 <87a86ejq1i.fsf@dell.be.48ers.dk>
Message-ID: <1495035933771-165163.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thank your for you feedback,

I solved the issue I had with the SVN credential.  

In fact what I noticed is that as my svn server url start with something
like http://XXXX/svn/XXXX  the wget command is used by buildroot instead of
svn to download the tarballs.   by adding the --user toto  --password xxxx I
was able to be correctly authentified by my svn server.

Thank you again.
Samir MOUHOUNE 



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Hop-tout-set-svn-credentials-when-using-svn-to-download-tarballs-tp164671p165163.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
