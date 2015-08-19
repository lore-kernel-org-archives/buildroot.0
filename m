From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 11:12:24 +0200
Subject: [Buildroot] how to configure the ip address of beaglebone?
In-Reply-To: <CA+yqE79AfRuHWa26Sg6zcs8YYjxx1y-Khdp6nY1L5C_uXsevMQ@mail.gmail.com>
References: <CA+yqE79AfRuHWa26Sg6zcs8YYjxx1y-Khdp6nY1L5C_uXsevMQ@mail.gmail.com>
Message-ID: <20150819111224.1126ad7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hmidi Slim,

On Wed, 19 Aug 2015 02:37:30 +0200, Hmidi Slim wrote:

> I followed the tutorial of free electrons to use rootfs overlay to
> configure ip address but when I run make I got
> board/felabs/rootfs-overlay no such file or directory

Because the path to your overlay is wrong. But that's all we can say
since you don't provide the necessary details to allow us to give a
more detailed answer.

Please read http://www.catb.org/esr/faqs/smart-questions.html#beprecise.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
