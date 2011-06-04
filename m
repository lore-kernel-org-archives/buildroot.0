From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2011 10:35:31 +0200
Subject: [Buildroot] Anyone working on adding systemd and NetworkManager?
In-Reply-To: <BANLkTiksOpT2qCKdGm7QUji+jBU=Fzmzig@mail.gmail.com>
References: <BANLkTiksOpT2qCKdGm7QUji+jBU=Fzmzig@mail.gmail.com>
Message-ID: <20110604103531.57826da3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 May 2011 11:16:04 +0200
Daniel Mack <zonque@gmail.com> wrote:

> The subject says it all: did anyone look into what it takes to add
> systemd to buildroot as an alternative to the SysV init scripts? It
> seems that that would make a lot of sense for embedded devices.
> 
> Also, NetworkManager is being used more and more as the standard API
> to configure network configuration, Wifi access points and the like -
> has anyone used that package with buildroot yet?

I haven't heard of anyone packaging those two components, and they
would definitely be useful.

However, what about connman instead of NetworkManager ? It seems like
connman is more embedded/mobile oriented than NetworkManager, no?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
