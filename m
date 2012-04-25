From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Apr 2012 19:38:39 +0200
Subject: [Buildroot] [PATCH 1/4] package/multimedia: move networking
 libs out
In-Reply-To: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120425193839.3b45570b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Apr 2012 13:10:40 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Move networking libraries out of the Audio and Video category into the
> Libaries/Networking one.

I am not quite sure about this one. Even though it's true libmpd or
live555 have networking capabilities, I think their core feature is
more audio and/or video oriented, so it should be in some
Libraries->Audio or Libraries->Audio/Video section rather than
Libraries->Networking.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
