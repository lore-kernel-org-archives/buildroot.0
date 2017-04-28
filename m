From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:26:03 +0200
Subject: [Buildroot] [PATCH] python-web2py: security bump to version
	2.14.6
In-Reply-To: <20170425134423.3313-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Apr 2017 15:44:23 +0200")
References: <20170425134423.3313-1-peter@korsgaard.com>
Message-ID: <877f24iuqs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2016-4806 - Web2py versions 2.14.5 and below was affected by Local File
 > Inclusion vulnerability, which allows a malicious intended user to
 > read/access web server sensitive files.

 > CVE-2016-4807 - Web2py versions 2.14.5 and below was affected by Reflected
 > XSS vulnerability, which allows an attacker to perform an XSS attack on
 > logged in user (admin).

 > CVE-2016-4808 - Web2py versions 2.14.5 and below was affected by CSRF (Cross
 > Site Request Forgery) vulnerability, which allows an attacker to trick a
 > logged in user to perform some unwanted actions i.e An attacker can trick an
 > victim to disable the installed application just by sending a URL to victim.

 > CVE-2016-10321 - web2py before 2.14.6 does not properly check if a host is
 > denied before verifying passwords, allowing a remote attacker to perform
 > brute-force attacks.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
