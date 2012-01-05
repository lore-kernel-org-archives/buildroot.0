From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jan 2012 18:06:24 +0100
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <201201051027.05059.minimod@morethan.org>
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <20120105163648.3bf64bcd@skate>
 <201201051027.05059.minimod@morethan.org>
Message-ID: <20120105180624.380257c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 5 Jan 2012 10:27:02 -0600,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> It looks to me as if the intent was in the handling of symbolic links.
> ls -d * does not dereference symbolic links.

So does 'cp -a', I think.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
