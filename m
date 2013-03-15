From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 15:00:51 +0100
Subject: [Buildroot] =?utf-8?b?4oCYX19jdHlwZV90b3VwbG93X3TigJkgYW5kIA==?=
 =?utf-8?b?4oCYX19jdHlwZV9tYXNrX3TigJkgZG9lcyBub3QgbmFtZSBhIHR5cGU=?=
In-Reply-To: <CAJEG_NfYFc782e3iy+z_gwitxQT60BPJkX-2R0Ho5CAu9pxL6w@mail.gmail.com>
References: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
 <20130315105421.675ecf61@skate>
 <CAJEG_NfYFc782e3iy+z_gwitxQT60BPJkX-2R0Ho5CAu9pxL6w@mail.gmail.com>
Message-ID: <20130315150051.0b91422e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jorge Ventura,

On Fri, 15 Mar 2013 08:51:03 -0500, Jorge Ventura wrote:

> Thank you for your attention to my problem.
> Yes, after clean all cycle. No matter what I do, I have always the same
> error. The program I am trying to compile is firewall builder that is based
> on qt4. Buildroot has all libraries required by the package (it's not too
> many).

Ok.

> To avoid problems trying to fix that I always do a complete clean when I
> make change in the configuration. Here is the buildroot config and next the
> uClibc config with no change made by me.
> 
> Please, at uClibc config take a look in the options UCLIBC_HAS_CTYPE_xxxx,
> maybe what I am having is related with those parameters.

I will try to reproduce your problem. However, you really should *not*
be making modifications to the uClibc configuration, unless you really
know what you're doing. All the Buildroot dependencies and package
testing is done with our default uClibc configuration. If you move
away, even slightly, from this default configuration, then it is pretty
much expected that you get build issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
