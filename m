From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:31:10 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
 create users
In-Reply-To: <606d.50e4ee64.b8dde@xionine.xdna.net>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
 <54c3.50e3ac2d.33c5c@xionine.xdna.net>
 <201301021931.54897.yann.morin.1998@free.fr>
 <606d.50e4ee64.b8dde@xionine.xdna.net>
Message-ID: <20130103113110.621c0e92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cam Hutchison,

On Thu, 03 Jan 2013 02:35:16 -0000, Cam Hutchison wrote:

> Another +1 for awk here - processing record-oriented files is what
> awk is good at, but I can understand not wanting to introduce that
> dependency.

We already depend on awk:

  http://git.buildroot.net/buildroot/tree/support/dependencies/dependencies.sh#n133

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
