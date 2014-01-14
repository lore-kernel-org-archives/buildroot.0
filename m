From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 13 Jan 2014 19:58:54 -0500
Subject: [Buildroot] luarocks compilation during install to target?
Message-ID: <CANxTyt6iEL+2pz3+_=A8NcD7aTYLGY2cYTDAU_2iYbtX7Sq-SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois,

While trying the new luarocks mods with a couple packages (lua-cjson,
luasocket) with Q set to nothing ("Q="), I noticed that the actual
compilation occurs during the "Installing to target" phase rather than
in the "Building" phase.  Expected?

I imagine that the results work okay, but thought I'd ask just in case ...

Danomi -
