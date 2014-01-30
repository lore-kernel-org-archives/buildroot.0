From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 20:47:43 +0100
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <1389862338.919140.855251422258.5.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
Message-ID: <20140130204743.6c3cfb1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Thu, 16 Jan 2014 16:52:18 +0800, Jeremy Kerr wrote:

> +KEXEC_LITE_VERSION = 6c762a7
> +KEXEC_LITE_SITE = git://github.com/antonblanchard/kexec-lite
> +KEXEC_LITE_LICENSE = GPL

This should be GPLv2+

It would be nice if the license text was added to the upstream project.
Maybe something that you can suggest to Anton :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
