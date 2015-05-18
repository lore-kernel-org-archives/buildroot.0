From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 16:13:04 +0200
Subject: [Buildroot] [PATCH v5 24/24] cpio: new package
In-Reply-To: <CANn-YGRXCwhNgKo=Xb-e_ev_iRg=qbLmC_eUP0zaz2PZ1ceGLg@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-25-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJKiJ2hvSpLb1mq20_My+HASOgVro8n79B8xZGuR3qCWQ@mail.gmail.com>
 <CANn-YGRXCwhNgKo=Xb-e_ev_iRg=qbLmC_eUP0zaz2PZ1ceGLg@mail.gmail.com>
Message-ID: <20150518161304.656913c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Mon, 18 May 2015 09:09:05 -0500, Clayton Shotwell wrote:

> That is a good question. I am only adding the package because I need
> to be able to create a cpio archive on my target.

So why do you add a host variant?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
