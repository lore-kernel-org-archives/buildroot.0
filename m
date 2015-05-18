From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 09:16:59 -0500
Subject: [Buildroot] [PATCH v5 24/24] cpio: new package
In-Reply-To: <20150518161304.656913c5@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-25-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJKiJ2hvSpLb1mq20_My+HASOgVro8n79B8xZGuR3qCWQ@mail.gmail.com>
 <CANn-YGRXCwhNgKo=Xb-e_ev_iRg=qbLmC_eUP0zaz2PZ1ceGLg@mail.gmail.com>
 <20150518161304.656913c5@free-electrons.com>
Message-ID: <CANn-YGQg-N9OFeCHX-uopuP5cRS5ctFOSVrc+2koihJ2=RLbXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 18, 2015 at 9:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Mon, 18 May 2015 09:09:05 -0500, Clayton Shotwell wrote:
>
>> That is a good question. I am only adding the package because I need
>> to be able to create a cpio archive on my target.
>
> So why do you add a host variant?

I added it mainly because I could and I had an easy way to test it. I
can remove the host option if needed. What is the reasoning behind
relying on the host system cpio tool?

Thanks,
Clayton
