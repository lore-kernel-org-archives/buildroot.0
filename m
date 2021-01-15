From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 15 Jan 2021 05:44:55 +0000
Subject: [Buildroot] Buildroot ARM with Altera FPGA de10-standard
In-Reply-To: <2793fb72-6cbf-14b0-ea39-6a18a7b0d489@litinow.com>
References: <mailman.9.1610539203.245130.buildroot@busybox.net>
 <c6f6425d6673f9ae60641de8a595af8d@umbiko.net>
 <2793fb72-6cbf-14b0-ea39-6a18a7b0d489@litinow.com>
Message-ID: <ad26a529bd7fa2dc771ff67cbea3121f@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mauricio,

On 2021-01-14 15:00, Mauricio Litinow wrote:

> If I change it to use the last version of Buildroot, please can you
> share with me what Terasic document describes the 'Target Options' and
> the 'Toolchain' settings ? It is yet very confused in my mind.

The 'Target options' did not change from the 2017 version, use the 
settings from the Terasic documentation.

'Toolchain' has a few additional options (e.g. additional languages), 
take the settings from the documentation and leave the extra options at 
their default value.

> Also, what GCC linaro and kernel headers version should I use with the
> last version of the Buildroot?

I hope you used the newer kernel and toolchain from the documentation, 
they should be OK. Don't change everything at once.

You can skip step 7.2 if you don't want to change the Buildroot standard 
settings, but take a look at Buildroot's 'System configuration' menu.

Kind regards,
Andreas
