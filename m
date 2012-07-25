From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 07:42:58 +0100
Subject: [Buildroot] [PATCH] gpsd: fix qt build problem
In-Reply-To: <20120724230041.29d9502f@skate>
References: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
 <20120724230041.29d9502f@skate>
Message-ID: <CAHt8ZCP8C7qiaSR7OhdYHUoEK2uF7cLQ=WUraa-aqkzJvfpiBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 July 2012 22:00, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I'm sorry but no, this is not the right way of fixing it. The QtCore
> and QtNetwork header paths are already on the build command line. It's
> just that they are wrong because they have two times the sysroot
> location:

Yes, agreed. Thanks for the feedback. (I see that you have now
submitted patches to fix this properly.)

Simon.
