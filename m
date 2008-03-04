From: John Voltz <john.voltz@gmail.com>
Date: Mon, 3 Mar 2008 19:57:41 -0500
Subject: [Buildroot] more stuff for buildroot
Message-ID: <46a136670803031657g5520b45s7026145d87d168a5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I dropped in here a couple of weeks ago to offer some new stuff for
buildroot. I think most of my ugly work is now fixed, so if somebody
is interested in pulling from subversion, here's the link (below). I
still have three issues I'm currently working on. First, the blackbox
window manager crashes when it tries to read the styles file, it must
have something to do with uClibc 0.9.29, because it works fine with
0.9.28. Webkit+Midori crashes on a lot of websites with either
segfaults or bus errors And last, but not least, I cannot for the life
of me create a working filesystem for x86. Has anyone tried this
recently? It always locks up after init takes over. Weird things
happen with the busybox shell (try mount -t versus mount -vt, or
strace -o  and see what I mean) and bash will not work at all. Any
insight into these issues would be appreciated.

svn checkout http://buildroot.googlecode.com/svn/trunk/ buildroot-read-only

Regards,

John Voltz
