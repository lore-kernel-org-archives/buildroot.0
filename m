From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Mar 2016 13:03:42 +0200
Subject: [Buildroot] [initscripts] Default script /etc/init.d/S40network
In-Reply-To: <CALtfCQbJOpzar6wAmdaXzp2U7ZGLSxiZKB6yd4s_xyxxWO5fxg@mail.gmail.com>
 (=?utf-8?B?IsOTc2NhciBHw7NtZXo=?= Fuente"'s message of "Tue, 29 Mar 2016
 12:37:56 +0200")
References: <CALtfCQbJOpzar6wAmdaXzp2U7ZGLSxiZKB6yd4s_xyxxWO5fxg@mail.gmail.com>
Message-ID: <87d1qd8s1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I'm building a buildroot platform with raspberry pi Compute Module. I'm
 > using Init system BusyBox and the package initscrpts is selected
 > automatically.

 > The problem is this package has the S40network script, but the RPi compute
 > module doesn't have ethernet, so I think this script has to be deleted for
 > RPi compute module, doesn't it?

No, why do you think that? S40network is still needed to configure the
loopback interface (127.0.0.1).

-- 
Bye, Peter Korsgaard
