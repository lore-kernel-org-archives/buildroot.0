From: Mike Crowe <drmikecrowe@gmail.com>
Date: Thu, 3 Dec 2009 08:33:20 -0500
Subject: [Buildroot] Help understanding how to develop with buildroot
In-Reply-To: <20091203142418.205e65e4@surf>
References: <16d4c3590912021826v916b813gf6f422634058df54@mail.gmail.com> 
	<878wdktkm6.fsf@macbook.be.48ers.dk>
	<16d4c3590912030440j4655c776w9dc54c3f0fe46cab@mail.gmail.com> 
	<87r5rcryj1.fsf@macbook.be.48ers.dk> <20091203142418.205e65e4@surf>
Message-ID: <16d4c3590912030533u22f6ba6am906d1773d41e70a1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perfect!  That's exactly what I needed guys, thank you!

On Thu, Dec 3, 2009 at 8:24 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Thu, 03 Dec 2009 14:13:22 +0100,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
> > OK, you can trigger a rebuild of just your package by removing the
> > correct file (depends on how you integrated it in BR what that file
> > is) or simply delete the build_arm/<package> directory.
>
> See also http://buildroot.org/buildroot.html#rebuilding_packages for
> details.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091203/dca19768/attachment.htm>
