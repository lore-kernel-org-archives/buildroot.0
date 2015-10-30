From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 30 Oct 2015 13:36:57 +0100
Subject: [Buildroot] /dev management ?
In-Reply-To: <56335FDD.9060109@yahoo.fr>
References: <56335FDD.9060109@yahoo.fr>
Message-ID: <56336469.2080600@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/30/2015 01:17 PM, David Picard wrote:
> I am trying to get the ft6x06 touchscreen driver to work. When I load 
> the driver, /dev/input/mouse0 is created, but no /dev/input/event*. 

Recall the default raspberry_defconfig builds evdev as module instead of 
into the kernel.
So you might need to do "modprobe evdev"


Yours sincerely,

Floris Bos
