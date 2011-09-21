From: Marc Gauthier <marc@tensilica.com>
Date: Tue, 20 Sep 2011 21:01:35 -0700
Subject: [Buildroot] Xtensa support
In-Reply-To: <20110920203530.2cc44bee@skate>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
 <20110315180743.5e34890b@surf>
 <1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
 <20110315192211.3c59f861@surf>
 <1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
 <20110315210538.1973f87f@surf>
 <779935.72384.qm@web161802.mail.bf1.yahoo.com>
 <4D81FB3E.7060307@carallon.com>	<20110318165939.651bf88b@surf>
 <4D87C0B5.1090503@tensilica.com> <20110920203530.2cc44bee@skate>
Message-ID: <522C1DF17AF50042AD8AE87F7887BD3D020C5F4943@exch.hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello Piet,
>
> Le Mon, 21 Mar 2011 14:18:45 -0700,
> Piet Delaney <pdelaney@tensilica.com> a ?crit :
>
>> In summary, we are just getting back to getting buildroot up-to-date
>> and would appropriate your support when trying to pull this off.
>
> Do you have any news about the Xtensa support in Buildroot ? Are you
> still interested in having this support in the mainline Buildroot ?


We're certainly still interested.  And have been maintaining buildroot
in our own trees.  However, we're temporarily short on people in that
area at the moment, so although we and our customers have been more
active lately on buildroot for Xtensa, submitting patches back has been
embarassingly slow.  (Btw, if you have expertise and interest in
toolchains or OS, we have openings in California ;-)

If you're curious, some of it is here, but far from cleaned up!!:

http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-new.git;a=shortlog;h=Xtensa-Patches

and an earlier version in buildroot-next.


> I am remain concerned by the fact that we carry some special stuff to
> support Xtensa, but he Xtensa architecture support has never been
> updated since it was merged in Buildroot. Of course, it is our goal to
> support configurable architectures such as Xtensa, but the support for
> those architectures needs to be actively maintained in Buildroot
> upstream.

Yes.  For example, some of the xtensa files under /target/ need to be
moved and/or refactored.  And a defconfig added in /configs/.
(Hopefully you now take pull requests?  easier than patches)


> Unfortunately, none of the main Buildroot developers have
> Xtensa-capable hardware, so it's a bit hard to contribute to this
> effort.


Do I hear volunteers? :-)  We've discussed sending out boards in the
past, but that turned out to be a bit more sideline effort than hoped.
Looks like an easier approach is to use an instruction set simulator.
It can boot Linux, so should be fine.  If you're interested I'll be
very happy to share the details.  Helping hands are most appreciated.


Merci!
-Marc



> Best regards,
>
> Thomas
