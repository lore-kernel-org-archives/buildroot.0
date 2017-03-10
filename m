From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:57:34 +0100
Subject: [Buildroot] [RFC: PATCH 3/3] system: enable predictable net
 interface names
In-Reply-To: <CACXmVibUnH38chTyOboc0fJMN2kn3NWm2Dnhg8xbi82ddPotZg@mail.gmail.com>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-4-git-send-email-eric.le.bihan.dev@free.fr>
 <CACXmVibUnH38chTyOboc0fJMN2kn3NWm2Dnhg8xbi82ddPotZg@mail.gmail.com>
Message-ID: <20170310225734.05223bda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 21:07:00 +0100, Peter Korsgaard wrote:

> If it all boils down to it being a systemd specific option that can be
> handled by a single symlink in an overlay/post-build script, then I
> don't think it is worth to have it.

Considering the lack of feedback from Eric on the topic, I've marked
his patch as Rejected in patchwork.

Please do not hesitate to resubmit with a better explanation that
answers the questions asked during the review. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
