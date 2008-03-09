From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Mar 2008 22:50:38 +0100
Subject: [Buildroot] Build failure with busybox 1.9.1
In-Reply-To: <47D149B9.9060603@carallon.com> (Will Wagner's message of "Fri\,
	07 Mar 2008 13\:57\:13 +0000")
References: <47D149B9.9060603@carallon.com>
Message-ID: <87od9nbm8h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hi All, Have just tried a new config from scratch and it is
 Will> failing while configuring busybox as there is no
 Will> package/busybox/busybox-1.9.0.config file, previously I think
 Will> it used the 1.6.0 file.

Hmm, I don't see why it would try to to use that file - Are you sure
you didn't change the config by hand?
