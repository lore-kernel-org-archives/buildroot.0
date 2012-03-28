From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Mar 2012 17:46:44 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
 $(HOST_DIR)/opt/perl
In-Reply-To: <CAFbHwiS_oCLGfi5Pt4UGqVKsjT5j_bG5MTOKm7rGJm9+Pi_wAA@mail.gmail.com>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk>
 <20120328095532.71abc612@skate>
 <87bonhax4p.fsf@macbook.be.48ers.dk>
 <CAFbHwiQUZKJeD-F2z_EnPC=QE-FhuRDb3bZUenEjmprJE6MPGw@mail.gmail.com>
 <20120328125547.6873d986@skate> <20120328145211.470f0fc3@skate>
 <CAFbHwiQyqFR_S4XE7jT==e3waOzQQDBg=7bm+Kb500QK=Gvskw@mail.gmail.com>
 <20120328151808.17795410@skate>
 <CAFbHwiS_oCLGfi5Pt4UGqVKsjT5j_bG5MTOKm7rGJm9+Pi_wAA@mail.gmail.com>
Message-ID: <20120328174644.606542c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 28 Mar 2012 15:00:36 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> I think I may have a solution. It looks like Red Hat (and hence
> CentOS) remove support for LD_RUN_PATH by default:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=136009
> 
> However there is a flag to turn it back on. Setting this seems to get
> me a sane runpath. Does this look ok? I assume it will silently do
> nothing on non-RH systems.

Ah, ah, it looks like a very good solution indeed.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks for the time you have spent investigating this problem!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
