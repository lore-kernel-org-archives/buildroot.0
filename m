From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 11 May 2007 14:52:07 +0200
Subject: [Buildroot] Could not compile buildroot
In-Reply-To: <945223.44926.qm@web57415.mail.re1.yahoo.com>
References: <945223.44926.qm@web57415.mail.re1.yahoo.com>
Message-ID: <20070511125207.GA2509@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 10, 2007 at 02:35:06PM -0700, Andrew Pham wrote:
>Hello everybody,
>
>I was trying to compile buildroot packages but it failed with error messages as below:
>
>which: no sed in (/usr/bin)
>which: no sed in (/usr/bin)
>which: no sed in (/usr/bin)

Do you have /bin/sed and if so, does it work?

Please update to svn revision >= 18607 and retry.
