From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Dec 2010 13:45:33 +0100
Subject: [Buildroot] [PATCH 12/13] screen: bump to version 4.0.3
In-Reply-To: <4D133983.5040807@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
	<1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>
	<20101223083303.07f8a70f@surf> <87zkrwsy45.fsf@macbook.be.48ers.dk>
	<20101223095057.6c7ff091@surf> <4D133983.5040807@zacarias.com.ar>
Message-ID: <20101223134533.15ceb51a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Dec 2010 08:58:59 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> I'm not quite fond of huge "configure" patches, i'd rather patch
> configure.in and autoreconf since it's easier to port to a newer version
> later on - though it adds up to a little more build time.

Agreed.

The idea is also to have those patches submitted upstream, so hopefully
in one of the next releases, we can get rid of the patch and the
autoreconfiguration step.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
