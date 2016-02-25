From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:14:51 +0100
Subject: [Buildroot] Incorrect kernel configuration produced from
 _defconfig file
In-Reply-To: <20160225170443.2e6208f4@free-electrons.com>
References: <CAF_dkJAcuTbdu97oMi_-W7Bd6-4pGx633qE=+UaNHwb6Z_5wCg@mail.gmail.com>
 <20160225170443.2e6208f4@free-electrons.com>
Message-ID: <20160225161451.GE12073@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 25/02/2016 at 17:04:43 +0100, Thomas Petazzoni wrote :
> I've Cc'ed Yann on this aspect, and also my colleague Alex who already
> saw this problem in the past IIRC.
> 

Yes, that is how I solved it for OE with Yann's advice:
http://git.openembedded.org/openembedded-core/commit/?id=9b75f6a5786ff7b2e6219d78b38f0032f100c660

oldnoconfig is now an alias for olddefconfig but appeared earlier so it
was used to do the right thing with more kernel version.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
