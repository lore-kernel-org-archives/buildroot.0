From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 14:14:05 +0200
Subject: [Buildroot] imx6 platform var-som-solo
In-Reply-To: <CALtfCQZz4Pc9mhwr=7t37oyty-KWCPRackStkV67H6rSeu+1Gw@mail.gmail.com>
References: <CALtfCQZz4Pc9mhwr=7t37oyty-KWCPRackStkV67H6rSeu+1Gw@mail.gmail.com>
Message-ID: <20160804141405.70e0e848@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 13:52:50 +0200, Oscar Gomez Fuente wrote:

> I made something similar with the raspberry pi 2B and I didn't have any
> problem. I can't find how to select OpenGL and EGL to free the option to
> select eglfs.

Enable the imx-gpu-viv package, which provides the OpenGL ES and EGL
implementation for i.MX6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
