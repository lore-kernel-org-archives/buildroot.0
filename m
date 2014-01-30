From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 20:46:41 +0100
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <1389862338.919140.855251422258.5.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
Message-ID: <20140130204641.02b5d319@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Thu, 16 Jan 2014 16:52:18 +0800, Jeremy Kerr wrote:

> +	select BR2_PACKAGE_LIBELF
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_DTC_PROGRAMS

I have no idea how kexec-lite works, but I'm a bit surprised by the
dependency on dtc. Does it builds the Device Tree source at runtime on
the target?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
