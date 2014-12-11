From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 23:57:32 +0100
Subject: [Buildroot] systemd: syslog.socket fails
In-Reply-To: <548A0422.1080400@free.fr>
References: <5489C246.9020805@free.fr>
 <CAGrucu1SpBB0J-9wVynW1q_PA=VFgSxkMAkv8T_cM-jyAW3SJw@mail.gmail.com>
 <548A0422.1080400@free.fr>
Message-ID: <20141211235732.1ecaf93e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 11 Dec 2014 21:52:50 +0100, Thierry Bultel wrote:

> Thanks,
> that was the trick indeed.
> 
> So the problem is that buildroot shoud create that link when installing
> rsyslog to target, when systemd is the chose init system.

Please do not hesitate to propose a patch to do this. It would be
useful to that other people using rsyslog+systemd have a working setup
out of the box.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
