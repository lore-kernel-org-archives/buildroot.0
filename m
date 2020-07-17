From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Jul 2020 08:52:54 +0200
Subject: [Buildroot] [PATCH] package/go: bump version to 1.13.13
In-Reply-To: <20200716185615.1439944-1-christian@paral.in> (Christian
 Stewart's message of "Thu, 16 Jul 2020 11:56:15 -0700")
References: <20200716185615.1439944-1-christian@paral.in>
Message-ID: <877dv2ske1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > go1.13.13 (released 2020/07/14) includes security fixes to the
 > crypto/x509 and net/http packages.

Please mention the security impact in the subject, E.G. package/go:
security bump to version 1.13.13

I've btw noticed that 1.13.14 is already out with more fixes, care to
send a patch?

-- 
Bye, Peter Korsgaard
