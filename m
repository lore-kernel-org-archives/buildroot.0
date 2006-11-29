From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 09:52:12 +0100
Subject: [Buildroot] new DHCP version and make error
In-Reply-To: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
References: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
Message-ID: <20061129085212.GC26441@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 09:27:39PM +0100, Rafael A Barrero wrote:
>Hi guys;
>
>New to the list... and to buildroot. I've been working with embedded linux
>on the application side, but never really dug too deep enough to build my
>own system until now. I also wanted to say thanks for all the hard work.
>
>BusyBox seems to build against DHCP 3.0.4, but the FTP server at ISC

Busybox does definitely _not_ build against DHCP 3.0.4 :)
Busybox has it's own dhcp impl which i recommend to use. If you have
trouble with udhcp from busybox then let me point you to the busybox
list.

HTH,
Bernhard
