From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 21:39:53 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.4-P2
In-Reply-To: <20180929193039.29827-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 29 Sep 2018 21:30:39 +0200")
References: <20180929193039.29827-1-peter@korsgaard.com>
Message-ID: <878t3c2nee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes
 > (http://ftp.isc.org/isc/bind9/9.11.4-P2/RELEASE-NOTES-bind-9.11.4-P2.txt):

 >  * There was a long-existing flaw in the documentation for ms-self,
 >    krb5-self, ms-subdomain, and krb5-subdomain rules in update-policy
 >    statements.  Though the policies worked as intended, operators who
 >    configured their servers according to the misleading documentation may
 >    have thought zone updates were more restricted than they were; users of
 >    these rule types are advised to review the documentation and correct
 >    their configurations if necessary.  New rule types matching the
 >    previously documented behavior will be introduced in a future maintenance
 >    release.  [GL !708]

 >  * named could crash during recursive processing of DNAME records when
 >    deny-answer-aliases was in use.  This flaw is disclosed in CVE-2018-5740.
 >    [GL #387]

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
