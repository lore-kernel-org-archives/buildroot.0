From: Manuel =?UTF-8?B?R3Jvw58=?= <mgr@nordkrater.de>
Date: Tue, 19 Jul 2016 22:47:46 +0200
Subject: [Buildroot] New to list
In-Reply-To: <b1af7fd6-45cc-3564-1840-d85a32cf414e@cox.net>
References: <b1af7fd6-45cc-3564-1840-d85a32cf414e@cox.net>
Message-ID: <20160719224746.3367ce6e@jenova.fritz.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jul 2016 15:58:11 -0700
Chris Sparks <mr_ada@cox.net> wrote:

> Hello,

Hello Chris,

> [...]
> I am trying to build this with ubuntu 16.04 and I found out that it 
> doesn't support ncurses-dev so I can't use menuconfig.

I don't have an Ubuntu 16.04 at my fingertips right now, but errors
like this on Ubuntu usually mean the required package is not installed.
Try installing 'ncurses-dev' or 'libncurses5-dev' using apt-get, and
menuconfig should work fine. This worked for me on Ubuntu 12/14 at
least.
There are also other package requirements for using buildroot, as you
can see in the documentation[0] (ncurses is listed in the ?Optional
packages?). Just in case anything else might be missing.

I hope this helps you using menuconfig.

As for the problems with your Raspberry Pi 3, I unfortunately can not
help you, since I never used the device myself.

[0] https://buildroot.org/downloads/manual/manual.html#requirement
-- 
Gr??e/Regards
Manuel Gro?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160719/df40807a/attachment.asc>
