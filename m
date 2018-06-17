From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:51:04 +0200
Subject: [Buildroot] [PATCH] netplug: look for init script
 configurations at /etc/default/
In-Reply-To: <20180605022459.13790-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Mon, 4 Jun 2018 23:24:59 -0300")
References: <20180605022459.13790-1-casantos@datacom.com.br>
Message-ID: <871sd5qumv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > We are working to make all sysvinit scripts conformant to a pattern and
 > /etc/default/ seems to be a good choice, since 34 packages already get
 > optional configurations from files at that directory.

 > netplug still installs an init script at /etc/rc.d/init.d/.  This will
 > be fixed in a future patch that will refactor the init scripts.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
