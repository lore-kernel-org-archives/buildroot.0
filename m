From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 May 2020 03:50:49 +0000
Subject: [Buildroot] [Bug 12891] New: QEMU , libvirt-bin,
 qemu-kvm Package Support required
Message-ID: <bug-12891-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12891

            Bug ID: 12891
           Summary: QEMU , libvirt-bin,qemu-kvm Package Support required
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ameya.joshi at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

Our device requires support for below packages

qemu-kvm libvirt-bin virt-manager qemu-system

i did find qemu-system, which gets installed after selecting QEMU

but i don't find the remaining packages.

I found an old patch that says atleast libvirt was added to buildroot

https://patchwork.ozlabs.org/project/buildroot/patch/20171127104131.27975-4-casantos at datacom.ind.br/

Is there a plan to add these packages.

qemu-kvm 
libvirt-bin 
virt-manager

-- 
You are receiving this mail because:
You are on the CC list for the bug.
