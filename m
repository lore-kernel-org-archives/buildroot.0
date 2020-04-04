From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Apr 2020 17:28:25 +0200
Subject: [Buildroot] [PATCH] package/apache: security bump to version
 2.4.43
In-Reply-To: <20200402182053.5043-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Apr 2020 20:20:53 +0200")
References: <20200402182053.5043-1-peter@korsgaard.com>
Message-ID: <871rp35kyu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >   *) SECURITY: CVE-2020-1934 (cve.mitre.org)
 >      mod_proxy_ftp: Use of uninitialized value with malicious backend FTP
 >      server. [Eric Covener]

 >   *) SECURITY: CVE-2020-1927 (cve.mitre.org)
 >      rewrite, core: Set PCRE_DOTALL flag by default to avoid unpredictable
 >      matches and substitutions with encoded line break characters.
 >      The fix for CVE-2019-10098 was not effective.  [Ruediger Pluem]

 > The LICENSE file has been updated to fix a s/waranties/warranties/ typo, so
 > update the hash to match and adjust the spacing to match recent agreements:

 > -This software is provided "as is" and any express or implied waranties,
 > +This software is provided "as is" and any express or implied warranties,

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
