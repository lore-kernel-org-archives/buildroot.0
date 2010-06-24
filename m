From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 14:03:13 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 autotools-conversion
In-Reply-To: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
References: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100624140313.09e20a06@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Jun 2010 22:20:54 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Here is a set of package conversions to the autotools infrastructure,
> coming from cmao and Paul Jones.

I've rebased and pushed an updated version of this branch, which adds a
patch to links I forgot to git add. The patch allows links to build
with a !LARGEFILE toolchain.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
