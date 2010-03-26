From: Yury Luneff <bitterman@ya.ru>
Date: Fri, 26 Mar 2010 14:37:15 +0300
Subject: [Buildroot] unable to login to buildroot
In-Reply-To: <28032853.post@talk.nabble.com>
References: <28032853.post@talk.nabble.com>
Message-ID: <1672284876.20100326143715@ya.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the one way to search is to recheck your toolchain + libc.

I recall, the same problem occurs when getty or bash are aborted 
abnormally due to libc or gcc problems and you will have what you're 
dealing with.
