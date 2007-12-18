From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 18 Dec 2007 18:43:43 +0200
Subject: [Buildroot] modprobe: cannot parse modules.dep error
In-Reply-To: <BAY131-W9EFC287D61A251C968D02E2630@phx.gbl>
References: <BAY131-W32EA6D41FC5B236081ADF0E2630@phx.gbl>
	<4767A7B2.2000702@promwad.com>
	<BAY131-W9EFC287D61A251C968D02E2630@phx.gbl>
Message-ID: <4767F8BF.3050303@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

saravanan chanemouganandam wrote:
> Hi Ivan,
>  
>  
> Here is the starce on iptables showing call to "/sbin/modprobe" . I don't understand why it tries to load the modules thru modprobe when all netfilter ipables and xtables supports are built into the kernel.
>  
> Execuse me for the mail received in a junk format.
>  

Think iptables do not have a way to know if you compiled iptables as modules or in kernel.
I'd suggest to try ask on iptables mailing list why it has such behaviour.


Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
