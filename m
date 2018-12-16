From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:33:15 +0100
Subject: [Buildroot] [PATCH] nginx: bump to version 1.15.7
In-Reply-To: <20181211093900.6617-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 11 Dec 2018 10:39:00 +0100")
References: <20181211093900.6617-1-peter@korsgaard.com>
Message-ID: <87d0q15f8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > 1.15.7 contains a number of bugfixes. From the changes file:
 >      *) Bugfix: memory leak on errors during reconfiguration.

 >     *) Bugfix: in the $upstream_response_time, $upstream_connect_time, and
 >        $upstream_header_time variables.

 >     *) Bugfix: a segmentation fault might occur in a worker process if the
 >        ngx_http_mp4_module was used on 32-bit platforms.

 > https://nginx.org/en/CHANGES

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
