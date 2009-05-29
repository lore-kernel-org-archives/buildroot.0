From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 29 May 2009 07:25:19 +0200
Subject: [Buildroot] Building only toolchain
Message-ID: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

Is it possible to build only toolchain in buildroot? I tried to search
the makefiles, but I couldn't find a target that would do it.  It seems
that there are some absolute paths stored in buildroot toolchain
binaries(at least ccache has) so I can't just copy them to another
system. Or can the toolchain be built somehow that it doesn't store any
local information there?

 

I don't want to build whole system, but just applications so only
toolchain is needed and not the whole buildroot. I also like to use the
same toolchain that was used in buildroot to prevent any problems that
might come from using different toolchain.

 

Teemu Keskinarkaus

 

Software System Engineer

CC Systems Oy

Finlaysoninkuja 21, 33210 Tampere, Finland 

Mobile +358 400 330 047

Switchboard +358 207 699 190

Fax +358 207 699 199

www.cc-systems.com <http://www.cc-systems.com/> 

 

CC Systems

- advanced machine controls

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090529/74a1d35c/attachment.htm>
