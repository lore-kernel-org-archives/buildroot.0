From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 15 Mar 2011 10:28:54 -0700
Subject: [Buildroot] inittab for Busybox
In-Reply-To: <20110315180743.5e34890b@surf>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
Message-ID: <AANLkTinc6Aeu7A7_ZZEi8oxvSs3pzAJH9YtZAL=FkAvH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to second what Thomas said. I have been through both the sysvinit
inittab and the busybox inittab and the busybox one works fine. As I recall,
it also has a tiny variation in the location of the RC directory, so you
might look at those differences which I think also depens on the skeleton
base files.
On Mar 15, 2011 10:07 AM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 15 Mar 2011 12:37:01 -0400
> "Heyendal, Carl" <CHeyendal@stanleyworks.com> wrote:
>
>> I have not enabled support for sysvinit in my project. Could someone
>> tell me why Buildroot adds an inittab file that's incompatible with
>> BusyBox? I looked at the mail archives but no one seems to have asked
>> that question before.
>
> How do you see that the inittab is incompatible with Busybox ? Many of
> us use it every day without problem.
>
> When sysvinit is not selected, fs/skeleton/etc/inittab is the inittab
> that is used, and it is compatible with Busybox init.
>
> When sysvinit is selected, package/sysvinit/inittab is used instead.
>
>> Also in the mail archives, some reference is made to documentation
>> about creating your own inittab file. Does that documentation still
>> exist somewhere? I've looked but can't find it.
>
> You should refer to the Busybox documentation, as this is not something
> related to Buildroot directly. See examples/inittab in Busybox sources.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/ff3c1830/attachment.html>
