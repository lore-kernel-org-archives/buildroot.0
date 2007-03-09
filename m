From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Mar 2007 09:24:05 +0100
Subject: [Buildroot] zcat default
In-Reply-To: <45DF35E9.4060905@cs.helsinki.fi>
References: <45DF35E9.4060905@cs.helsinki.fi>
Message-ID: <20070309082405.GA11011@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 23, 2007 at 08:43:53PM +0200, Heikki Lindholm wrote:
>Hi,
>
>BR2_ZCAT defaults to zcat, and it is basically always used to extract 
>files with .gz suffix. POSIX zcat [1] is specified to append .Z to 
>filenames that don't already have such suffix. This is also the 
>behaviour on Mac OS X. Therefore, it would make sense to use gunzip -c 
>or gzip -dc as a default instead.
>
>[1] http://www.opengroup.org/onlinepubs/000095399/utilities/zcat.html

Agree. Changed in r18045. Thanks for the heads up
