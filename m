From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 22 Apr 2015 08:44:14 -0400
Subject: [Buildroot] [RFC v2 0/5] common service startup files
In-Reply-To: <20150406105122.4b13f5b0@free-electrons.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
 <20150406105122.4b13f5b0@free-electrons.com>
Message-ID: <CANPyyuPmh4cd4Wb3tk5+j7x3AVEaXMHZpk94NyEx5v-aby6csA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> To be honest, my feeling is that I don't really like Buildroot to
> invent its own "abstract" language to describe the initialization of
> services, then used to generate SysV and Systemd unit files.

Seconded, from the currently-using-systemd camp. One of the nice
things about systemd is getting to use upstream service files as much
as possible, rather than having to maintain our own.
