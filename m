From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 09:18:07 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented
 config fragment
In-Reply-To: <20170715224949.25598-1-yann.morin.1998@free.fr>
References: <20170715224949.25598-1-yann.morin.1998@free.fr>
Message-ID: <20170716091807.7ce7e5c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 00:49:49 +0200, Yann E. MORIN wrote:
> Currently, defining a config fragment in the runtime test infra requires
> that the fragment not to be indented. This is beark, and causes grievance
> when looking at the code (e.g. to fix it).
> 
> Just strip out all leading spaces/tabs when writing the configuration
> lines into the config file.

Seems good in principle, but could you give an example of an indented
config fragment you intend to use?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
