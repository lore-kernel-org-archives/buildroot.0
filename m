From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 16:34:54 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.12
In-Reply-To: <20210201125557.11169-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Feb 2021 13:55:57 +0100")
References: <20210201125557.11169-1-peter@korsgaard.com>
Message-ID: <87lfc6jxep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2021-3281: Potential directory-traversal via archive.extract()

 > The django.utils.archive.extract() function, used by startapp --template and
 > startproject --template, allowed directory-traversal via an archive with
 > absolute paths or relative paths with dot segments.

 > For details, see the advisory:
 > https://www.djangoproject.com/weblog/2021/feb/01/security-releases/

 > Additionally, 3.0.11 fixed a regression:
 > https://docs.djangoproject.com/en/3.1/releases/3.0.11/

 > Update indentation in hash file (two spaces).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
