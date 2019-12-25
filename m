From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:58:25 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.1
In-Reply-To: <20191220081917.3765-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 20 Dec 2019 09:19:17 +0100")
References: <20191220081917.3765-1-peter@korsgaard.com>
Message-ID: <87k16krxcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2019-19844: Potential account hijack via password reset form
 >   By submitting a suitably crafted email address making use of Unicode
 >   characters, that compared equal to an existing user email when lower-cased
 >   for comparison, an attacker could be sent a password reset token for the
 >   matched account

 > In addition, a number of bugs have been fixed.  For details, see the release
 > notes:
 > https://docs.djangoproject.com/en/dev/releases/3.0.1/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Instead of cherry-picking this commit, I have instead bumped 2019.02.x
and 2019.11.x to 2.2.9, which contains the same fix (and 2.2.x is a LTS
release, 2.1.x is now EOL).

-- 
Bye, Peter Korsgaard
