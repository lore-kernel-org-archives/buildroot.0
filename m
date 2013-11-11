From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 09:55:06 +0000
Subject: [Buildroot] [PATCH] iozone: disable for uClibc 0.9.31
In-Reply-To: <87siv36z7u.fsf@dell.be.48ers.dk>
References: <1384163348-17932-1-git-send-email-spdawson@gmail.com>
 <87siv36z7u.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMDzCeuTC+pFXWUy_dtTG4E7Sq7Pjc4JSaDO43s9Bc+AA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 11 November 2013 09:53, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Committed, thanks. It sounds like it also needs to depend on
> BR2_TOOLCHAIN_HAS_THREADS. Care to send a patch adding that dependency
> and a comment line?

Yes, okay.

Simon.
