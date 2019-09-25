From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 20:00:53 +0200
Subject: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.66.0
In-Reply-To: <87y2yq3u3z.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 15 Sep 2019 09:18:40 +0200")
References: <20190911112735.11824-1-peter@korsgaard.com>
 <87y2yq3u3z.fsf@dell.be.48ers.dk>
Message-ID: <87o8z8l0h6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Fixes the following security vulnerabilities:
 >> CVE-2019-5481: FTP-KRB double-free
 >> https://curl.haxx.se/docs/CVE-2019-5481.html

 >> CVE-2019-5482: TFTP small blocksize heap buffer overflow
 >> https://curl.haxx.se/docs/CVE-2019-5482.html

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
