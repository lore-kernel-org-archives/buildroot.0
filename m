From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 21 Feb 2013 10:52:46 +0000
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <87621mhs7d.fsf@dell.be.48ers.dk>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <87621mhs7d.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 February 2013 10:33, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Or simply get rid of the huge patch - It's just an optimization, and not
> really needed, right?

The problem is that, for libmad to be usable on avr32, this
optimization patch really *is* needed.

Simon.
