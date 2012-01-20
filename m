From: Karl Krach <mailinglists@bluespirit.la>
Date: Fri, 20 Jan 2012 12:32:17 +0100
Subject: [Buildroot] Qt command line issue
Message-ID: <2cff0fc240e25617ac5c8ae586f9c698@bluespirit.la>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have two configuration problems:

1) After initializing Qt (new QApplication()) all output to the cmd is 
blocked (stderr, stdout, etc). This happens on the tty (serial 
connection) but not when connecting via SSH.

2) The output via SSH lacks of a "carriage return". On X11 it's working 
fine, but on the ARM evaluation board the output looks like this:
my debug output
                my debug output
                               my debug output
                                              my debug output
                                                             ...

Are these a known problems and how can I solve them?


Best Regards,

Charly
