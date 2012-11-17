From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 17 Nov 2012 20:19:30 +0000
Subject: [Buildroot] [PATCH] libusb: disable on avr32
In-Reply-To: <87sj88rns4.fsf@dell.be.48ers.dk>
References: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
 <87wqxkrofx.fsf@dell.be.48ers.dk>
 <CAHt8ZCMF-cvx4W+GrGUxqn1iBx9XDmGutVv-xGr1uF4M=o-A1A@mail.gmail.com>
 <87sj88rns4.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMoOjmGooxO5oR5+CbXKWkn2ATpL5P3B_YbOBuB8zaDgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17 November 2012 20:13, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Yes, that's the only solution we have right now.
>
> Remember to look recursively upwards. These libusb users might be
> selected by other packages.

Okay; thanks Peter.

Simon.
