From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 19:26:10 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <507DBD9F.4030307@mind.be>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate> <507DBD9F.4030307@mind.be>
Message-ID: <20121017192610.2ad5a7e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 16 Oct 2012 22:03:43 +0200, Arnout Vandecappelle wrote:

>   Sorry that I'm not letting this go, but: how is this similar to the
> project concept that was removed in 2009?  I'm not trying to share any
> of the build output between different projects -- the only thing that
> is shared is the buildroot directory.

I agree that you're not trying to share the build output between
different projects, as was the "project feature" that existed before
2009 did. That said, I still don't get the benefit of this PROJECT_DIR
thing when you can simply set you Linux configuration file, Linux
patches, U-Boot patches and so on to point to the correct location with
the existing Buildroot.

I don't see which problems it is solving, and to me, it only creates
yet another option to configure Buildroot that will only confuse
users.

But again, as I said in my earlier e-mails: this is just _my_ voice,
and I am not the only Buildroot developer or contributor, and I am not
the maintainer. So my voice is just my voice, nothing more.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
