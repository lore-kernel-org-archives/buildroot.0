From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 20 Sep 2015 10:27:15 +0100
Subject: [Buildroot] [PATCH v4 1/1] squeezelite: new package
In-Reply-To: <201509200912.t8K9CvJo012488@ms-omx03.plus.so-net.ne.jp>
References: <201509200912.t8K9CvJo012488@ms-omx03.plus.so-net.ne.jp>
Message-ID: <55FE7BF3.8010907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On 20/09/15 10:12, kei-k at ca2.so-net.ne.jp wrote:
[snip]

> +comment "squeezelite needs a toolchain w/ wchar, threads, mmu

One more time:

comment "squeezelite needs a toolchain w/ wchar, threads"

The comment will not be displayed when there is no support for MMU, so 
it's pointless to have that information on it. Also, you forgot the 
closing double quotes.

Regards,

Vincent.

[snip]
