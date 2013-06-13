From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 13 Jun 2013 09:55:04 +0100
Subject: [Buildroot] [PATCH] toolchain/uClibc: remove deprecated version
	0.9.31
In-Reply-To: <87k3lz2hcf.fsf@dell.be.48ers.dk>
References: <1371062793-27218-1-git-send-email-gustavo@zacarias.com.ar>
 <87k3lz2hcf.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCPEM0E87VSETkkb731SjiwoAcwBGY7D-0-UB5ua7fxgYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 June 2013 21:40, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>  Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Comitted, thanks.

Ah. I need uClibc 0.9.31 to support a long-running avr32-based
project. The only option available now in Buildroot is 0.9.33, which
for some reason results in a system that has unusably poor performance
compared to the 0.9.31-based build.

Is there any chance that uClibc 0.9.31 can be retained in Buildroot?
I'm not clear what the rationale for removing it is/was...

Simon.
