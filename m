From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 15:05:52 +0100
Subject: [Buildroot] [PATCH v2] log4cxx: needs threads
In-Reply-To: <1384177029-25518-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 11 Nov 2013 13:37:09 +0000")
References: <1384177029-25518-1-git-send-email-spdawson@gmail.com>
Message-ID: <87k3gf6njz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> Fixes build failures such as the following.

>   http://autobuild.buildroot.net/results/7b73901d9e8b5098cd96b54d292bb3ffffb3fe37/

> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  v2: At the suggestion of Thomas De Schampheleire, update the comment to
>  explain that dynamic library support is required

Committed, thanks.

-- 
Bye, Peter Korsgaard
