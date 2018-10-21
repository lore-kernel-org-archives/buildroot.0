From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 09:28:48 +0200
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
In-Reply-To: <5bcc083188f1f_56b83f8d16040a3c5959@ultri5.mail>
References: <CALFsTFVpjgYWNr=VoeT3Wj+DjYtFdUNNNw9_Z2COzQMrpxQxWQ@mail.gmail.com>
 <5bcc083188f1f_56b83f8d16040a3c5959@ultri5.mail>
Message-ID: <20181021092848.2c1abd44@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 02:01:37 -0300, Ricardo Martincoski wrote:

> We could update the default kernel image used by the test infra (today 3.11.0),

We can definitely update that pre-built image if needed. There is no
special reason to have a 3.11 based image, except this being the kernel
version I had around at the time I started playing with the test
infrastructure.

> The most elegant solution IMO is to add haveged to the image built for this test
> case by the test infra. This is what people with a real target with low entropy
> probably would use, I guess. There is no need to update the kernel this way.

I also don't see any problem with adding haveged in the image.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
