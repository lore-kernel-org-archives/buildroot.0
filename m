From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 20 Jan 2013 21:24:21 +0000
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <50FBFD8A.1030606@zacarias.com.ar>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
 <20130119113852.6d35aa94@skate>
 <CAHt8ZCOH9FgqzkB2KHJSSBc3k76-07iYNfsQ_rjzQCzOFGLEAg@mail.gmail.com>
 <50FBE8EC.6060602@zacarias.com.ar>
 <CAHt8ZCOMQR8NjrsQzcWqRz3hd2EUc+X_0osKOfn-8c=1wY59_Q@mail.gmail.com>
 <50FBFD8A.1030606@zacarias.com.ar>
Message-ID: <CAHt8ZCMv=DXs8syP30iJ_k0VjZpCKXptLHLv-x494XxZeBVerw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 January 2013 14:22, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> Some of the breakage is toolchain-related and we can't upgrade it.
> Most of the time it's gcc IIRC.
> Like the internal compiler errors for external toolchains, other than
> blacklisting/disabling packages there's not much to do.

Right, I understand. Thanks for the clarification.

Simon.
