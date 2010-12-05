From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Dec 2010 09:03:12 +0100
Subject: [Buildroot] DConf
In-Reply-To: <144644.21305.qm@web111106.mail.gq1.yahoo.com>
References: <1291509535.24014.2.camel@coalu.atr>
	<144644.21305.qm@web111106.mail.gq1.yahoo.com>
Message-ID: <20101205090312.76091a4c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 4 Dec 2010 16:50:10 -0800 (PST)
Justin Mark <oilehus@yahoo.com> wrote:

> when I built libgee with buildroot, it didn't need vala, don't know
> why their webite said requiring vala.  

I don't really know Vala, but at least Libgee is *written* in Vala, so
it means that you need a Vala compiler on your host in order to build
Libgee. As you can expect users to have a Vala compiler installed,
you'll have to add a vala compiler package into Buildroot, and make its
host variant a dependency of Libgee. If you have issues or don't know
how to do that, we can probably help you.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
