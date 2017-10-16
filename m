From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:46:58 +0200
Subject: [Buildroot] [PATCH v2] package/netplug: init script create
	needed lock directory
In-Reply-To: <20170905095456.15776-1-corjon.j@ecagroup.com> (Julien Corjon's
 message of "Tue, 5 Sep 2017 11:54:56 +0200")
References: <20170905083917.8625-1-corjon.j@ecagroup.com>
 <20170905095456.15776-1-corjon.j@ecagroup.com>
Message-ID: <87a80qwyst.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Corjon <corjon.j@ecagroup.com> writes:

 > Init script use /var/lock/subsys/netplugd but directory
 > /var/lock/subsys can be missing.

 > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
 > ---

 > v2:
 > - dont test already existing directory

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
