From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:29:19 +0200
Subject: [Buildroot] [PATCH] package/samba4: security bump to version
 4.9.6
In-Reply-To: <20190408104952.19872-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Apr 2019 12:49:52 +0200")
References: <20190408104952.19872-1-peter@korsgaard.com>
Message-ID: <875zrgff80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >  - CVE-2019-3870:
 >    During the provision of a new Active Directory DC, some files in the private/
 >    directory are created world-writable.
 >    https://www.samba.org/samba/security/CVE-2019-3870.html

 >  - CVE-2019-3880:
 >    Authenticated users with write permission can trigger a symlink traversal to
 >    write or detect files outside the Samba share.
 >    https://www.samba.org/samba/security/CVE-2019-3880.html

 > For more details, see the release notes:
 > https://www.samba.org/samba/history/samba-4.9.6.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
