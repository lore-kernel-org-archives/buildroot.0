From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 23:27:42 +0100
Subject: [Buildroot] trylink causes build errors
In-Reply-To: <20061122220501.98305.qmail@web90307.mail.mud.yahoo.com>
References: <20061122220501.98305.qmail@web90307.mail.mud.yahoo.com>
Message-ID: <20061122222742.GA4247@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 02:05:01PM -0800, No One wrote:
>
>Picked up the latest via svn (16637), did a default configuration with make menuconfig, ran make and got the following errors:
>
>
>make[1]: Entering directory `/home/will/box/buildroot/build_i686/busybox'
>  LINK    busybox_unstripped
>/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 5: function: not found
>/home/will/box/buildroot/build_i686/busybox/scripts/trylink: 11: Syntax error: "}" unexpected

What shell are you using?
does 
$ function foo () { echo bar ; }
$ foo
bar
$ unset foo

work? (note the parentheses)
If so, then bug vda resp. the busybox list or fix it upstream.

HTH,
