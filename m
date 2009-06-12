From: zealcook <zealcook@gmail.com>
Date: Fri, 12 Jun 2009 14:06:37 +0800
Subject: [Buildroot] patch-kernel.sh not work well?
Message-ID: <1244786798.19560.16.camel@cj>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, list

I want to use buildroot for my toolchian first. And I've many kernel's
patches as my target board. There are sencitive by order. But in patch
script(patch-kernel.sh) I cannot find it will do in my poinited way.
It just `ls' all patches and then `patch' them. If it only can do in
this way. I'm sure the patch cannot be patched for me.

Now i modified the script to tell whether need use `quilt' for this
thing. So I can write the sequence in series file and use quilt for
patching them. It works well for me now. 

But I'm not sure as i'm not familiar with buildroot.

Dose buildroot can do patch in a specified order like quilt above or
else?


Regards,

--
zc
