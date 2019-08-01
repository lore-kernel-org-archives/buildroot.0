From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 12:53:53 +0200
Subject: [Buildroot] [PATCH v3] dbus-python: add host package
In-Reply-To: <20181109003835.32642-1-bgenerous@impinj.com>
References: <20181109003835.32642-1-bgenerous@impinj.com>
Message-ID: <9d403e5e-df0c-357d-fd9c-7ce66e3127a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/11/2018 01:38, Brent Generous wrote:
> This can be useful for Python scripts running on a host machine that
> need to connect to a bus on a remote device, e.g. test scripts.
> 
> The target dbus-python depends on dbus instead of selecting it because
> dbus has dependencies that check that it is supported. Using 'select'
> would override those dependencies. For host-dbus, there are no such
> checks -- it's assumed the host has the features neeeded to run dbus, so
> it is okay to just depend on host-dbus.
> 
> The pyexpat dependency is not needed, as it is forced on for
> host-python.
> 
> Signed-off-by: Brent Generous <bgenerous@impinj.com>


 Applied to master, thanks.

 Sorry it took so long, after you were so quick to take into account our feedback.

 Regards,
 Arnout
