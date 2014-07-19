From: Vincent <vincent.stehle@laposte.net>
Date: Sat, 19 Jul 2014 14:45:00 +0200
Subject: [Buildroot] Raspberry + Usb to TTL Serial Cable issue
In-Reply-To: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
References: <CAK9TtU2hWsQ7J5yJMjLG9rOX9V+ga817bZbvAj0pj5ZHE92Beg@mail.gmail.com>
Message-ID: <53CA684C.2040202@bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/19/2014 02:30 PM, Sylvain LG wrote:
> What is still missing?

Hi,

Maybe you need to add some 'console=ttyAMA0,115200' arguments to your
kernel command line?

Best regards,

V.
