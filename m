From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 17:52:22 +0100
Subject: [Buildroot] install curl-config
In-Reply-To: <1374152325.5767391485439180621.JavaMail.httpd@webmail-40.iol.local>
 (sred's message of "Thu, 26 Jan 2017 14:59:40 +0100 (CET)")
References: <1374152325.5767391485439180621.JavaMail.httpd@webmail-40.iol.local>
Message-ID: <878tpxepbt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sred" == sred 94 at libero it <sred_94@libero.it> writes:

 > Dear Sirs,
 > I am using buildroot 2016.05 and I have installed libcurl library, but
 > I also need curl-config, because it is required by the pycurl package.

What do you mean exactly? It gets installed into
output/staging/usr/bin. Does pycurl need it at runtime (E.G. on the
target)?

-- 
Bye, Peter Korsgaard
