From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Apr 2018 22:23:07 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <87d0zeol26.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 04 Apr 2018 20:58:41 +0200")
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
 <3dd2f190fef3d71e1b2f1f5ec6f4323e8ee8c745.camel@embedded.rocks>
 <87d0zeol26.fsf@dell.be.48ers.dk>
Message-ID: <878ta2oh5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> It turned out that nothing needs to be done for static /dev as the
 >> symlinks are created now by the init system.

 > But how can that work? static /dev normally means readonly /dev.

That didn't come out very clear. What I wanted to say is that static
/dev should also work on a readonly fs, so these symlinks should be made
at build time, not at runtime.

-- 
Bye, Peter Korsgaard
