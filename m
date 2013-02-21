From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Feb 2013 11:58:12 +0100
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
 (Simon Dawson's message of "Thu, 21 Feb 2013 10:52:46 +0000")
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
 <771436318.25518.1361402063381.JavaMail.root@advansee.com>
 <87621mhs7d.fsf@dell.be.48ers.dk>
 <CAHt8ZCNf=k9LyXMob_DpzcOYtfBfhfNugr8n02vNwpB+s1fpkg@mail.gmail.com>
Message-ID: <87y5eigchn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 Simon> On 21 February 2013 10:33, Peter Korsgaard <jacmet@uclibc.org> wrote:
 >> Or simply get rid of the huge patch - It's just an optimization, and not
 >> really needed, right?

 Simon> The problem is that, for libmad to be usable on avr32, this
 Simon> optimization patch really *is* needed.

Ok, then lets fix it up instead.

-- 
Bye, Peter Korsgaard
