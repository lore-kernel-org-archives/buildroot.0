From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 11 Nov 2012 21:02:00 +0000
Subject: [Buildroot] [PATCH] lcdproc: bump version to 0.5.6
In-Reply-To: <20121111210859.5c6f7510@skate>
References: <1352207698-3407-1-git-send-email-spdawson@gmail.com>
 <20121111210859.5c6f7510@skate>
Message-ID: <CAHt8ZCM-ZSqQd=5WByXDvqY-2_NNfizWawJwMgNhPr=oMYrP7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

On 11 November 2012 20:08, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There are apparently build issues with lcdproc 0.5.6. Not sure if they
> are new or if they were present in older versions. See
> http://autobuild.buildroot.org/results/9967bc20a6094e836c4c18ff2cd30edef143bb8e/build-end.log.
> Basically, lcdproc uses -I<foo>/host/usr/include -L<foo>/host/usr/lib
> to build things for the target.

Okay; I'll have a look. (I must have missed this problem because I'm
applying quite a large local patch to lcdproc, which necessitates an
autoreconf.)

Simon.
