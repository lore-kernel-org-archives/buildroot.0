From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Nov 2012 08:24:26 +0100
Subject: [Buildroot] [PATCH 1/1] qextserialport : fix download and bump
 version
In-Reply-To: <CAExDhvZVYFjMHZvcoC4MAMjWS+cyaPt33tBNfFvtA9GavXc54A@mail.gmail.com>
References: <1352317186-2905-1-git-send-email-sagaert.johan@skynet.be>
 <874nl1avsi.fsf@dell.be.48ers.dk>
 <CAExDhvZVYFjMHZvcoC4MAMjWS+cyaPt33tBNfFvtA9GavXc54A@mail.gmail.com>
Message-ID: <20121108082426.48867708@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thiago A. Corr?a,

On Wed, 7 Nov 2012 21:26:19 -0200, Thiago A. Corr?a wrote:

> It's quite likely one of the examples being built.

Indeed. The examples patch removal was here for a reason: it shouldn't
have been removed. Some of the examples requires the GUI, and I didn't
bother making the examples conditional on whether the GUI was available
or not. This example patch should be re-added in one form or another.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
