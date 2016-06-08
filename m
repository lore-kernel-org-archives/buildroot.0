From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:42:54 +0200
Subject: [Buildroot] [PATCH] package/fetchmail: fix *.pyc compilation
In-Reply-To: <CAHXCMMLRjRmNFEp_a-BU+xRgK22Qh14ty3XKNzNXpspd80w-+Q@mail.gmail.com>
References: <20160608200851.7108-1-s.martin49@gmail.com>
 <20160608222517.2e1a61ea@free-electrons.com>
 <CAHXCMMLRjRmNFEp_a-BU+xRgK22Qh14ty3XKNzNXpspd80w-+Q@mail.gmail.com>
Message-ID: <20160608224254.4dea62ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Jun 2016 22:35:02 +0200, Samuel Martin wrote:

> I hesitated to do so, but since I did the fix, I posted it...

I think it is very good that you did the fix and submitted it upstream,
because it means that we can potentially remove the hook in the future.

> I'll do the hook.

Awesome, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
