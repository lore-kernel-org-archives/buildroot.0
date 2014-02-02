From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 2 Feb 2014 22:15:22 +0100
Subject: [Buildroot] Advice on new board support
Message-ID: <CA+TH9VmdX0iai204KWOjHk4ANqAPr8G00GMRpYJcGf++aAnkbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm preparing a patch for the Ariag25 SOM and its Terra carrier board
from http://acmesystems.it.
I made a working and minimal configuration for Ariag25 SOM in which I
enabled nothing more than a basic booting system.

For Terra, on the contrary, I'm building a more complex configuration
with dhcp, python and various other software, because Terra is a
carried board for rapid prototyping and the fairly basic configuration
of the plain simple Ariag25 is pretty useless on that.

I'm aiming for the inclusion of both configurations, but I think the
Terra one is really too big to be in configs. Right now I created a
board/acmesystems/ariag25 folder and placed the configuration there.

Is this the best way to get the patch accepted?

Thank you in advance!

Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
