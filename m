From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 16 Apr 2013 14:48:46 +0100
Subject: [Buildroot] [PATCH] monit: add license information
In-Reply-To: <87eheblas9.fsf@dell.be.48ers.dk>
References: <1366011607-31433-1-git-send-email-spdawson@gmail.com>
 <87eheblas9.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCOAKON3x0ac35oWttaUcvoAv2GQm_yMwNjaDaA1G3D4_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter; thanks for looking at this.

On 15 April 2013 22:54, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Hmm, I see very few files mentioning the 'any later version':

Yes, okay; it should be AGPLv3.

> src/monit.c also talks about a special openssl exception.
>
> How should we handle this?

Awkward. I wonder if it's simply a case of saying

MONIT_LICENSE = AGPLv3 OpenSSL

?

Simon
