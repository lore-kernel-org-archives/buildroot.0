From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 08:24:22 +0100
Subject: [Buildroot] BR: patching  diff f7abec2d1d1e5... direct
In-Reply-To: <4D833C5B.4090604@vaaraahi.com>
References: <4D833C5B.4090604@vaaraahi.com>
Message-ID: <20110319082422.0d63019a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Mar 2011 11:04:59 +0000
Nataraj S Narayan <nataraj@vaaraahi.com> wrote:

> I was trying to patch the diff of commit
> f7abec2d1d1e52f49f7d95c48165cde8cf41edb6 (patch) by
> Jean-Christophe PLAGNIOL-VILLARD, in the 'package' dir of buildroot.

All patches must be applied from the top directory of the source tree,
i.e not inside the package dir of Buildroot. This is nothing specific
to Buildroot: it works like this for all open-source projects.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
