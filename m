From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 17:23:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-12
In-Reply-To: <CANQCQpbx8cHi4reD2ScvubHQCfa_fGzz020KzRNmObhBA8iyWg@mail.gmail.com>
References: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
 <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
 <20200717173748.2485d781@windsurf.home>
 <CANQCQpbx8cHi4reD2ScvubHQCfa_fGzz020KzRNmObhBA8iyWg@mail.gmail.com>
Message-ID: <20200721172355.16a5a651@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Tue, 21 Jul 2020 10:13:03 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> I've submitted the following request to fix this
> 
> 1) Navigated to https://cveform.mitre.org/
> 2) "Select a request type" as "Request and update to an existing CVE Entry"
> 3) "Type of update requested" as "Update Description"
> 4) "CVE ID to be updated" as 2010-0751
> 5) "Description" as "We've found that the v1.24 fixes the CVE and all
> prior versions contain the bug.  The CVE currently lists that 1.24 is
> still vulnerable.  This can be proved by checking the CHANGES file
> within the source archive
> (https://sourceforge.net/projects/libnids/files/libnids/1.24/libnids-1.24.tar.gz/download)
> that outlines this ("fixed another remotely triggerable NULL
> dereference in ip_fragment.c") comment.  Also within that archive the
> source code src/ip_fragment on line 378 has the fix
> (https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=576281;filename=CVE-2010-1144.patch;msg=5)
> (NOTE 2010-1144 is a rejected CVE which was split to include
> 2010-0751)."

Thanks for doing this !

> Thomas, do you think it would be beneficial to add a section with
> these notes in the manual?

Reading your e-mail, I was precisely thinking "it would be great to
write this down somewhere". I don't know if the manual is the right
place though, as it is really for Buildroot maintainers/developers.
Would the Wiki be a better location ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
