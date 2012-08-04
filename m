From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 4 Aug 2012 21:10:40 +0100
Subject: [Buildroot] [PATCH] sudo: fix main executable permissions
In-Reply-To: <20120804144316.469003e8@skate>
References: <1343998111-15331-1-git-send-email-spdawson@gmail.com>
 <20120804144316.469003e8@skate>
Message-ID: <CAHt8ZCPK5Q1-30Vzd24Xghh=7Jogr5c2ug3Umggmv35sozhtKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 August 2012 13:43, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The principle is good, but not the way it is implemented.  Please use
> the <pkg>_PERMISSIONS infrastructure instead. See the documentation, or
> package/busybox/busybox.mk for an example.

Okay, thanks Thomas.

Simon.
