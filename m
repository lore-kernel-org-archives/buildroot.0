From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 15:57:36 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
 <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
 <20130828094824.5f917f48@skate>
 <CAAXf6LWz7_RYds7Zr7kdQHvhYXtNO1WEP+RX+0TTthfZURvi+Q@mail.gmail.com>
 <CAAXf6LVPQVzQpfCdeVrm2yNzEad8j2GS9pnna7YiKVnhTb=MQg@mail.gmail.com>
Message-ID: <20130908155736.30d50baf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 29 Aug 2013 09:40:41 +0200, Thomas De Schampheleire wrote:

> -$myPicture->drawScale(array("LabelRotation" => 90));
> +$myPicture->drawScale(array("LabelRotation" => 90, "LabelSkip" =>
> 10));

Thanks, this works, I've committed this and deployed on autobuild.b.o.

See
http://git.buildroot.net/buildroot-test/commit/?id=51317ea5ce4ea0244744ff284ecfb98a2743520d.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
