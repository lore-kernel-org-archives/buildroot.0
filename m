From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:34:30 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to version 2.1.1
In-Reply-To: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
Message-ID: <20170305213430.1d486293@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 19:27:48 +0100, Kurt Van Dijck wrote:
> Mosquitto combined with version 2.1.0 of libwebsockets yields a failing
> system. Version 2.1.1 restores the websocket interface again.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Applied to master, thanks!

Peter: even though this is a version bump, it seems like this one would
be needed on the LTS branch, since it apparently fixes a runtime issue
with Mosquitto.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
