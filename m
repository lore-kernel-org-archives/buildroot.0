From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:07:58 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
 output file
In-Reply-To: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
Message-ID: <20160225170758.1f444549@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, 25 Feb 2016 14:19:56 +0100, Thomas De Schampheleire wrote:

> When a package does not (by error) define FOO_SITE, and the source
> archive is not already present, the wget download helper will be
> invoked with as URL /foo-xxx.tar.gz. wget reports 'Scheme missing' and
> bails out, but _returns with a successful error code (0)_.

Shouldn't we simply be checking in the package infrastructure that
FOO_SITE is not empty?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
