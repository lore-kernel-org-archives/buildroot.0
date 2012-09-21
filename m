From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 09:13:27 +0200
Subject: [Buildroot] [PATCH] gettext: don't build tools if they won't be
 installed
In-Reply-To: <1348180978-20654-1-git-send-email-arnout@mind.be>
References: <1348180978-20654-1-git-send-email-arnout@mind.be>
Message-ID: <20120921091327.57710f5b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 21 Sep 2012 00:42:58 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> When only libintl is requested from gettext, it is not necessary to
> build and install the tools in staging.  Just run configure and make
> in the gettext-runtime directory.
> 
> This _will_ install the gettext executable in the target.  But that
> seems the correct thing to do, since it may be used by scripts.

Which scripts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
