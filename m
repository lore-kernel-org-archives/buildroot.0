From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 13 Apr 2013 18:42:14 +0100
Subject: [Buildroot] [PATCH] ofono: bump to version 1.12
In-Reply-To: <87vc7qq0cv.fsf@dell.be.48ers.dk>
References: <1365839373-19783-1-git-send-email-spdawson@gmail.com>
 <87vc7qq0cv.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCNmGkT79qtf-O3m8KzmOJPHrtzgTpFdR3eQA+kVDC2jWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter; thanks for the feedback.

On 13 April 2013 09:52, Peter Korsgaard <jacmet@uclibc.org> wrote:
> It does actually, but it's only visible if you define _GNU_SOURCE:

Ah; I had actually noticed that #ifdef block in the fcntl header, but
had failed to glean the significance. Thanks for the tip; I'll rework
my patch.

Simon.
