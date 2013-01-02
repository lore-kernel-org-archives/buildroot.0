From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 02 Jan 2013 16:15:43 -0300
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <20130102200144.5ed56106@skate>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
Message-ID: <50E4875F.6090305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/02/2013 04:01 PM, Thomas Petazzoni wrote:

> Here I'm really only removing things that the X.org project considers
> as unmaintained. So I would prefer if you could raise the fact that the
> SiS driver is still useful to the X.org people, so that they keep this
> driver. I don't think we can reasonably keep an unmaintained X.org
> driver in Buildroot if we want to easily continue to upgrade the other
> X.org packages.

Hmm?
I'm just pointing to the fact that i can test the sis (not sisusb....
completely different monster) driver, which is supported.
Regards.
