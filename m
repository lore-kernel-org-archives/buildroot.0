From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 17:19:17 +0200
Subject: [Buildroot] [PATCH v4 1/4] package/rpm: bump to version 4.12.0.1
In-Reply-To: <CALe+oY8XPdMd7ViBn9-_oqCSjeBeiPhLLmNrZQL4mXBvhkBpjg@mail.gmail.com>
References: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
 <20151011143414.4bf27c78@free-electrons.com>
 <CALe+oY8XPdMd7ViBn9-_oqCSjeBeiPhLLmNrZQL4mXBvhkBpjg@mail.gmail.com>
Message-ID: <20151016171917.08fe5e22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 16 Oct 2015 11:09:47 -0400, James Knight wrote:

> On Sun, Oct 11, 2015 at 8:34 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > So could you rework this package to make it work with musl/uclibc
> 
> Thanks for checking this; I'll give it a shot. :)
> 
> > In the mean time, I'll mark your patches as "Changes Requested" in
> > patchwork.
> 
> Minor patchwork question, when a patch has been flagged as "Changes
> Requested" and I submit a new one, should I flag the old patch as
> superseded?

You can do it if you want, but that's really not necessary. When a
patch is either in the "Changes Requested" state or the "Superseded"
state, we simply no longer see in the list of pending patches. This
means we won't care anymore about such patches, until the submitter
sends an updated version.

We never go back to older patches marked "Changes Requested" to change
them to "Superseded" when the new version comes.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
