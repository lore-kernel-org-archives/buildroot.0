From: Jonathan Bowman <bowmanjd@gmail.com>
Date: Mon, 17 May 2010 21:42:30 -0400
Subject: [Buildroot] Custom packages: downloading non-tarball packages
Message-ID: <AANLkTin1HjC23NvIyQVP2yzNQIYGaNLUIa88NWWnWIKn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am new to buildroot, but thanks to an elegant interface and clear
documentation, it is serving my needs quite nicely.

However, I do have a question regarding best practices. I note that in
the documentation it is not recommended to use the "manual" method in
the makefiles of new packages. However, I do not see in the other
methods how to deal with sources that are not tarballs. Some code
(strangely) only comes in zip files, while other code I would prefer
to download using svn, git, or another system.

Is there a recommended practice for these scenarios?

Thanks,
Jonathan
