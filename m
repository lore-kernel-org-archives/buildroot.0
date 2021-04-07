From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 11:18:56 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.14
In-Reply-To: <20210406204831.1046-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Apr 2021 22:48:31 +0200")
References: <20210406204831.1046-1-peter@korsgaard.com>
Message-ID: <87lf9ucv0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2021-28658: Potential directory-traversal via uploaded files

 > MultiPartParser allowed directory-traversal via uploaded files with suitably crafted file names.

 > Built-in upload handlers were not affected by this vulnerability.

 > For more details, see the announcement:
 > https://www.djangoproject.com/weblog/2021/apr/06/security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
