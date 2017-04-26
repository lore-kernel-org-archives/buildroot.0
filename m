From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 10:03:20 +0200
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.14
In-Reply-To: <e8750710-f475-fe87-79a4-edd6f655d5a0@mind.be>
References: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
 <3cc20a82-673d-f87b-e5c6-0acc428cfb1c@ginzinger.com>
 <9cbb711a-6026-8a69-a6c6-85dc140e2e4c@imgtec.com>
 <d6771575-8b26-f608-5d57-4d3c573eee36@ginzinger.com>
 <e8750710-f475-fe87-79a4-edd6f655d5a0@mind.be>
Message-ID: <20170426100320.00702ce9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Apr 2017 21:47:58 +0200, Arnout Vandecappelle wrote:

>  Is there a reason why you need this bump?

Well, do we need a reason to bump a package, other than "upstream has a
new release, possibly with new features/bug fixes" ? Tons of version
bumps we merged are not motivated by a specific reason, other than
making sure Buildroot uses recent versions of the different components.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
